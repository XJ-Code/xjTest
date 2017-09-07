//
//  XJAVCaptureViewController.m
//  xjTest
//
//  Created by Leon on 2017/2/4.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import "XJAVCaptureViewController.h"
#import <AVFoundation/AVFoundation.h>

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define customShowSize CGSizeMake(200, 200);

@interface XJAVCaptureViewController ()<AVCaptureVideoDataOutputSampleBufferDelegate>
/** 输入数据源 */
@property (nonatomic, strong) AVCaptureDeviceInput *input;
@property (nonatomic, strong) AVCaptureVideoDataOutput *output;

/** 输入输出的中间桥梁 负责把捕获的音视频数据输出到输出设备中 */
@property (nonatomic, strong) AVCaptureSession *session;
/** 相机拍摄预览图层 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *layerView;
/** 预览图层尺寸 */
@property (nonatomic, assign) CGSize layerViewSize;
/** 有效扫码范围 */
@property (nonatomic, assign) CGSize showSize;

@property (nonatomic , strong) UIImageView* xjImageView;

@end

@implementation XJAVCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //显示范围
    self.showSize = customShowSize;
    
    //调用
    [self creatScanQR];
    //添加拍摄图层
    [self.view.layer addSublayer:self.layerView];
    [self.view addSubview:self.xjImageView];
    //开始二维码
    [self.session startRunning];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIImageView *)xjImageView {
    if (!_xjImageView) {
        _xjImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    }
    return _xjImageView;
}

-(void)creatScanQR{
    
    /** 创建输入数据源 */
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];  //获取摄像设备
    
    //修改前必须先锁定
    [device lockForConfiguration:nil];
    if ([device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus]) {
        [device setFocusMode:AVCaptureFocusModeContinuousAutoFocus];
    }
    
    //    int flags = NSKeyValueObservingOptionNew; //监听自动对焦
    //    [device addObserver:self forKeyPath:@"adjustingFocus" options:flags context:nil];
    
    //增加设备 移动的监听
    if (!device.subjectAreaChangeMonitoringEnabled) {
        device.subjectAreaChangeMonitoringEnabled = YES;
    }
    
    [device unlockForConfiguration];
    //对设备的 是否移动做监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xj_deveiceDidMode:) name:AVCaptureDeviceSubjectAreaDidChangeNotification object:nil];
    
    
    //    [device setFocusMode:AVCaptureFocusModeAutoFocus];
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];  //创建输出流
    
    /** 创建输出数据源 */
    self.output = [[AVCaptureVideoDataOutput alloc] init];
    self.output.videoSettings = [NSDictionary dictionaryWithObject:
                                 [NSNumber numberWithInt:kCVPixelFormatType_32BGRA]
                                                            forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    [self.output setSampleBufferDelegate:self queue:dispatch_get_main_queue()];  //设置代理 在主线程里刷新
    
    /** Session设置 */
    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];   //高质量采集
    [self.session addInput:self.input];
    [self.session addOutput:self.output];
    
    /****************************** 添加 输出流 为图片**************************/
    
    /** 扫码视图 */
    //扫描框的位置和大小
    self.layerView = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.layerView.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.layerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    // 将扫描框大小定义为属行, 下面会有调用
    self.layerViewSize = CGSizeMake(_layerView.frame.size.width, _layerView.frame.size.height);
    
}
//当设备移动
- (void)xj_deveiceDidMode :(NSNotification*)obj{
//    NSLog(@"当前设备正在移动哟");
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    // 通过抽样缓存数据创建一个UIImage对象
    UIImage *image = [self imageFromSampleBuffer:sampleBuffer];
    self.xjImageView.image = image;
}
// 通过抽样缓存数据创建一个UIImage对象
- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer {
    // 为媒体数据设置一个CMSampleBuffer的Core Video图像缓存对象
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // 锁定pixel buffer的基地址
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // 得到pixel buffer的基地址
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    
    // 得到pixel buffer的行字节数
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // 得到pixel buffer的宽和高
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // 创建一个依赖于设备的RGB颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 用抽样缓存的数据创建一个位图格式的图形上下文（graphics context）对象
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                 bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    // 根据这个位图context中的像素数据创建一个Quartz image对象
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    // 解锁pixel buffer
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
    
    // 释放context和颜色空间
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // 用Quartz image创建一个UIImage对象image
    UIImage *image = [UIImage imageWithCGImage:quartzImage scale:1.0f orientation:UIImageOrientationRight];
    
    // 释放Quartz image对象
    CGImageRelease(quartzImage);
    
    return (image);
    
}

@end
