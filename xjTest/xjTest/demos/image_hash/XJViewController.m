//
//  XJViewController.m
//  xjTest
//
//  Created by Leon on 2016/10/17.
//  Copyright © 2016年 FreeLa. All rights reserved.
//

#import "XJViewController.h"
#import "Radar.h"


@interface XJViewController ()
@property (nonatomic , strong) Radar * centerRadarView;

@property (nonatomic , strong) UILabel* xjlabel;
@end

@implementation XJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"xxx";
    self.view.backgroundColor = [UIColor blueColor];
    
    self.xjlabel = [[UILabel alloc] init];
    [self.view addSubview:_xjlabel];
    self.xjlabel.frame = CGRectMake(20, 300, 400, 500);
    self.xjlabel.textColor = [UIColor whiteColor];
    self.xjlabel.numberOfLines = 16;
    
    self.centerRadarView = [[Radar alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _centerRadarView.center = self.view.center;
    _centerRadarView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:_centerRadarView];
    
    
    UIImageView* image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 120, 100, 100)];
    image.image = [UIImage imageNamed:@"img6.png"];
    [self.view addSubview:image];
    
    UIImageView* image2 = [[UIImageView alloc] initWithFrame:CGRectMake(120, 120, 100, 100)];
    image2.image = [UIImage imageNamed:@"img7.png"];
    [self.view addSubview:image2];
    
    
    [self xj_checkImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)xj_checkImage{
//    dispatch_async(dispatch_get_main_queue(), ^{
        UIImage* image1 = [UIImage imageNamed:@"person.jpg"];
//        image1 = [self OriginImage:image1 scaleToSize:CGSizeMake(8, 8)];
//        image1 = [self getGrayImage:image1];
//        NSString* myHash1 = [self myHash:image1];
//        NSLog(@"这里是明翰距离对比 11&&22   1=【%@】 ",myHash1 );
        UIImage* image2 = [UIImage imageNamed:@"bbb.png"];
////        UIImage* image2_1 = [self OriginImage:image2 scaleToSize:CGSizeMake( 8,  8)];
////        UIImage* image2_2 = [self getGrayImage:image2_1];
////        NSString* myHash2 = [self myHash:image2_2];
//    
//       
//        NSLog(@"这里是明翰距离对比 11&&22   1=【%@】   2=【%@】 ",myHash1 ,myHash1);
//        self.xjlabel.text = [NSString stringWithFormat:@"这里是明翰距离对比 11&&22   1=【%@】】 ",myHash1 ];
//    });
    
    UIImage * mImage1 = [self xj_getGrayImage:[self scaleToSize: image1 size:CGSizeMake(8, 8)]];
    [self pHashValueWithImage:mImage1];
//    UIImage * mImage2 = [self xj_getGrayImage:[self scaleToSize: image2 size:CGSizeMake(8, 8)]];
//    NSInteger diff = [self getDifferentValueCountWithString:[self pHashValueWithImage:mImage1] andString:[self pHashValueWithImage:mImage2]];
    
//    NSLog(@"xsasaxsadsad=%ld",diff);
    
    
}


//1.缩小图片8*8
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
//2.将图片转换成灰度图片
-(UIImage*)xj_getGrayImage:(UIImage*)sourceImage
{
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}
//3.计算出图片平均灰度，然后每一点灰度与平均灰度比较，大于平均值是1，小于平均值是0
-(NSString *)pHashValueWithImage:(UIImage *)image{
    NSMutableString * pHashString = [NSMutableString string];
    CGImageRef imageRef = [image CGImage];
    unsigned long width = CGImageGetWidth(imageRef);
    
    unsigned long height = CGImageGetHeight(imageRef);
    CGDataProviderRef provider = CGImageGetDataProvider(imageRef);
    
    NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
    //    NSLog(@"data = %@",data);
    const  char * heightData = (char*)data.bytes;
    
    int sum = 0;
    
    for (int i = 0; i < width * height; i++)
    {
        
        if (heightData[i] != 0)
        {
            
            sum += heightData[i];
            printf("灰度平均值111===========【%d】--【%d】--【%d】\n ",heightData[i],i,sum);
        }
    }
    int avr = sum / (width * height);
    NSLog(@"灰度平均值2222-----------%d",avr);
    for (int i = 0; i < width * height; i++)
    {
        if (heightData[i] >= avr) {
            [pHashString appendString:@"1"];
        }
        else {
            [pHashString appendString:@"0"];
        }
    }
    NSLog(@"pHashString = %@,pHashStringLength = %lu",pHashString,(unsigned long)pHashString.length);
    return pHashString;
}
//4.得到两个hashValue不同点数
-(NSInteger)getDifferentValueCountWithString:(NSString *)str1 andString:(NSString *)str2{
    NSInteger diff = 0;
    const char * s1 = [str1 UTF8String];
    const char * s2 = [str2 UTF8String];
    for (int i = 0 ; i < str1.length ;i++){
        if(s1[i] != s2[i]){
            diff++;
        }
    }
    return diff;
}
















//第一步，缩小尺寸。将图片缩小到8x8的尺寸，总共64个像素。这一步的作用是去除图片的细节，只保留结构、明暗等基本信息，摒弃不同尺寸、比例带来的图片差异。
-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;   //返回的就是已经改变的图片
}

//第二步，简化色彩。将缩小后的图片，转为64级灰度。也就是说，所有像素点总共只有64种颜色。

-(UIImage*)getGrayImage:(UIImage*)sourceImage
{
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

//第三步，计算平均值。计算所有64个像素的灰度平均值。
//以下代码来自github

-(unsigned char) grayscalePixels:(UIImage *) image
{
    // The amount of bits per pixel, in this case we are doing grayscale so 1 byte = 8 bits
#define BITS_PER_PIXEL 8
    // The amount of bits per component, in this it is the same as the bitsPerPixel because only 1 byte represents a pixel
#define BITS_PER_COMPONENT (BITS_PER_PIXEL)
    // The amount of bytes per pixel, not really sure why it asks for this as well but it's basically the bitsPerPixel divided by the bits per component (making 1 in this case)
#define BYTES_PER_PIXEL (BITS_PER_PIXEL/BITS_PER_COMPONENT)
    // Define the colour space (in this case it's gray)
    CGColorSpaceRef colourSpace = CGColorSpaceCreateDeviceGray();
    // Find out the number of bytes per row (it's just the width times the number of bytes per pixel)
    size_t bytesPerRow = image.size.width * BYTES_PER_PIXEL;
    // Allocate the appropriate amount of memory to hold the bitmap context
    unsigned char *bitmapData = (unsigned char*) malloc(bytesPerRow * image.size.height);
    // Create the bitmap context, we set the alpha to none here to tell the bitmap we don't care about alpha values
    CGContextRef context = CGBitmapContextCreate(bitmapData,image.size.width,image.size.height,BITS_PER_COMPONENT,bytesPerRow,colourSpace,kCGImageAlphaNone);
    
    // We are done with the colour space now so no point in keeping it around
    CGColorSpaceRelease(colourSpace);
    // Create a CGRect to define the amount of pixels we want
    CGRect rect = CGRectMake(0.0,0.0,image.size.width,image.size.height);
    // Draw the bitmap context using the rectangle we just created as a bounds and the Core Graphics Image as the image source
    CGContextDrawImage(context,rect,image.CGImage);
    // Obtain the pixel data from the bitmap context
    unsigned char *pixelData = (unsigned char*)CGBitmapContextGetData(context);
    // Release the bitmap context because we are done using it
    CGContextRelease(context);
    return *pixelData;
#undef BITS_PER_PIXEL
#undef BITS_PER_COMPONENT
}
//返回就是0101字符串了
-(NSString *) myHash:(UIImage *) img {
//    unsigned char pixelData = [self grayscalePixels:img];
    unsigned char *pixelData =  [self convertUIImageToBitmapRGBA8:img];
    NSMutableString * pHashString = [NSMutableString string];
    CGImageRef imageRef = [img CGImage];
    unsigned long width = CGImageGetWidth(imageRef);
    unsigned long height = CGImageGetHeight(imageRef);
    CGDataProviderRef provider = CGImageGetDataProvider(imageRef);
    NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
    //    NSLog(@"data = %@",data);
    const  char * heightData = (char*)data.bytes;
    int sum = 0;
    
    for (int i = 0; i < width * height; i++)
    {
        printf("灰度平均值111===========%d ",heightData[i]);
        if (heightData[i] != 0)
        {
            sum += heightData[i];
        }
    }
    int avr = sum / (width * height);
    NSLog(@"灰度平均值2222-----------%d",avr);
    for (int i = 0; i < width * height; i++)
    {
        if (heightData[i] >= avr) {
            [pHashString appendString:@"1"];
        }
        else {
            [pHashString appendString:@"0"];
        }
    }
    NSLog(@"pHashString = %@,pHashStringLength = %lu",pHashString,(unsigned long)pHashString.length);
    return pHashString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (unsigned char *) convertUIImageToBitmapRGBA8:(UIImage *) image {
    
    CGImageRef imageRef = image.CGImage;
    
    // Create a bitmap context to draw the uiimage into
    CGContextRef context = [self newBitmapRGBA8ContextFromImage:imageRef];
    
    if(!context) {
        return NULL;
    }
    
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    CGRect rect = CGRectMake(0, 0, width, height);
    
    // Draw image into the context to get the raw image data
    CGContextDrawImage(context, rect, imageRef);
    
    // Get a pointer to the data
    unsigned char *bitmapData = (unsigned char*)CGBitmapContextGetData(context);
    
    // Copy the data and release the memory (return memory allocated with new)
    size_t bytesPerRow = CGBitmapContextGetBytesPerRow(context);
    size_t bufferLength = bytesPerRow * height;
    
    unsigned char *newBitmap = NULL;
    
    if(bitmapData) {
        newBitmap = (unsigned char *)malloc(sizeof(unsigned char) * bytesPerRow * height);
        
        if(newBitmap) {    // Copy the data
            for(int i = 0; i < bufferLength; ++i) {
                newBitmap[i] = bitmapData[i];
            }
        }
        
        free(bitmapData);
        
    } else {
        NSLog(@"Error getting bitmap pixel data\n");
    }
    
    CGContextRelease(context);
    return newBitmap;
}

- (CGContextRef) newBitmapRGBA8ContextFromImage:(CGImageRef) image {
    CGContextRef context = NULL;
    CGColorSpaceRef colorSpace;
    uint32_t *bitmapData;
    
    size_t bitsPerPixel = 32;
    size_t bitsPerComponent = 8;
    size_t bytesPerPixel = bitsPerPixel / bitsPerComponent;
    
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    
    size_t bytesPerRow = width * bytesPerPixel;
    size_t bufferLength = bytesPerRow * height;
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if(!colorSpace) {
        NSLog(@"Error allocating color space RGB\n");
        return NULL;
    }
    
    // Allocate memory for image data
    bitmapData = (uint32_t *)malloc(bufferLength);
    
    if(!bitmapData) {
        NSLog(@"Error allocating memory for bitmap\n");
        CGColorSpaceRelease(colorSpace);
        return NULL;
    }
    
    //Create bitmap context
    
    context = CGBitmapContextCreate(bitmapData,
                                    width,
                                    height,
                                    bitsPerComponent,
                                    bytesPerRow,
                                    colorSpace,
                                    kCGImageAlphaPremultipliedLast);    // RGBA
    if(!context) {
        free(bitmapData);
        NSLog(@"Bitmap context not created");
    }
    
    CGColorSpaceRelease(colorSpace);
    
    return context;
}

- (UIImage *) convertBitmapRGBA8ToUIImage:(unsigned char *) buffer
                                withWidth:(int) width
                               withHeight:(int) height {
    
    
    size_t bufferLength = width * height * 4;
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer, bufferLength, NULL);
    size_t bitsPerComponent = 8;
    size_t bitsPerPixel = 32;
    size_t bytesPerRow = 4 * width;
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    if(colorSpaceRef == NULL) {
        NSLog(@"Error allocating color space");
        CGDataProviderRelease(provider);
        return nil;
    }
    
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault |kCGImageAlphaPremultipliedLast;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    CGImageRef iref = CGImageCreate(width,
                                    height,
                                    bitsPerComponent,
                                    bitsPerPixel,
                                    bytesPerRow,
                                    colorSpaceRef,
                                    bitmapInfo,
                                    provider,    // data provider
                                    NULL,        // decode
                                    YES,            // should interpolate
                                    renderingIntent);
    
    uint32_t* pixels = (uint32_t*)malloc(bufferLength);
    
    if(pixels == NULL) {
        NSLog(@"Error: Memory not allocated for bitmap");
        CGDataProviderRelease(provider);
        CGColorSpaceRelease(colorSpaceRef);
        CGImageRelease(iref);
        return nil;
    }
    
    CGContextRef context = CGBitmapContextCreate(pixels,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpaceRef,
                                                 bitmapInfo);
    
    if(context == NULL) {
        NSLog(@"Error context not created");
        free(pixels);
    }
    
    UIImage *image = nil;
    if(context) {
        
        CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, width, height), iref);
        
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
        
        // Support both iPad 3.2 and iPhone 4 Retina displays with the correct scale
        if([UIImage respondsToSelector:@selector(imageWithCGImage:scale:orientation:)]) {
            float scale = [[UIScreen mainScreen] scale];
            image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
        } else {
            image = [UIImage imageWithCGImage:imageRef];
        }
        
        CGImageRelease(imageRef);
        CGContextRelease(context);
    }
    
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRelease(iref);
    CGDataProviderRelease(provider);
    
    if(pixels) {
        free(pixels);
    }
    return image;
}
//
//-(double)CompareHist:(IplImage*)image1 withParam2:(IplImage*)image2
//{
//    int hist_size = 256;
//    float range[] = {0,255};
//    
//    IplImage *gray_plane = cvCreateImage(cvGetSize(image1), 8, 1);
//    cvCvtColor(image1, gray_plane, CV_BGR2GRAY);
//    CvHistogram *gray_hist = cvCreateHist(1, &hist_size, CV_HIST_ARRAY);
//    cvCalcHist(&gray_plane, gray_hist);
//    
//    IplImage *gray_plane2 = cvCreateImage(cvGetSize(image2), 8, 1);
//    cvCvtColor(image2, gray_plane2, CV_BGR2GRAY);
//    CvHistogram *gray_hist2 = cvCreateHist(1, &hist_size, CV_HIST_ARRAY);
//    cvCalcHist(&gray_plane2, gray_hist2);
//    
//    return cvCompareHist(gray_hist, gray_hist2, CV_COMP_BHATTACHARYYA);
//}






@end
