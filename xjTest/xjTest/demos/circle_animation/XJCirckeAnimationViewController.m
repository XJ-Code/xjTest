//
//  XJCirckeAnimationViewController.m
//  xjTest
//
//  Created by Leon on 2017/1/10.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import "XJCirckeAnimationViewController.h"
#import "XJCircleAnimationView.h"

#define xjWidth [UIScreen mainScreen].bounds.size

#define xj_circle_one  74
#define xj_circle_Two  72
#define xj_circle_Three  84

@interface XJCirckeAnimationViewController ()<CAAnimationDelegate>

@property (nonatomic , strong) UIImageView* imgView1;
@property (nonatomic , strong) UIImageView* imgView2;
@property (nonatomic , strong) UIImageView* imgView3;

@end

@implementation XJCirckeAnimationViewController
{
    CGPoint  xjcenter;
    XJCircleAnimationView* view;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat xjW1 = xj_circle_one*2;
        CGFloat xjW2 = xj_circle_Two*2;
        CGFloat xjW3 = xj_circle_Three*2;
        self.imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, xjW1, xjW1)];
        self.imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, xjW2, xjW2)];
        self.imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, xjW3, xjW3)];
//        [self.view addSubview:self.imgView1];
//        [self.view addSubview:self.imgView2];
//        [self.view addSubview:self.imgView3];
        xjcenter = CGPointMake((xjWidth.width)/2, (xjWidth.height)/2 -140);
        self.imgView1.center = xjcenter;
        self.imgView2.center = xjcenter;
        self.imgView3.center = xjcenter;
        self.imgView1.image = [UIImage imageNamed:@"ar_red_circle"];
        self.imgView2.image = [UIImage imageNamed:@"ar_write_circle"];
        self.imgView3.image = [UIImage imageNamed:@"ar_blue_circle"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
//    [self xj_start];/
    view = [[XJCircleAnimationView alloc] init];
    view.frame = CGRectMake(0, 0, xjWidth.width, xjWidth.height);
    [self.view addSubview:view];
    [view xj_circleStart];
    
    [self performSelector:@selector(xxxx) withObject:nil afterDelay:10];
    
    
    
    //画圆
    CGRect rect = CGRectMake(200, 200, 100, 100);
    UIBezierPath *beizPath=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50];
    //先画一个圆
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.path=beizPath.CGPath;
    layer.fillColor=[UIColor whiteColor].CGColor;//填充色
    layer.strokeColor=[UIColor redColor].CGColor;//边框颜色
    layer.lineWidth=6.0f;
    layer.lineCap=kCALineCapRound;//线框类型
    [self.view.layer addSublayer:layer];
    
    
    
}
- (void)xxxx{
    [view xj_done];
}

- (void)xj_start {
    CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.fillMode = kCAFillModeBackwards;
    animationGroup.beginTime = CACurrentMediaTime()  ;
    animationGroup.duration = 2;
    animationGroup.repeatCount = 1;
    animationGroup.timingFunction = defaultCurve;
    
    
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
    opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
    
    CABasicAnimation * scaleAnimationBig = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationBig.fromValue = @2.3;
    scaleAnimationBig.toValue = @0.9;
    
    animationGroup.animations = @[scaleAnimationBig, opacityAnimation];
    [_imgView1.layer addAnimation:animationGroup forKey:@"plulsing"];
    [_imgView2.layer addAnimation:animationGroup forKey:@"plulsing"];
    [_imgView3.layer addAnimation:animationGroup forKey:@"plulsing"];
    [self performSelector:@selector(xj_middle) withObject:nil afterDelay:2];
    
}
- (void)xj_middle {
    [_imgView1.layer removeAllAnimations];
    [_imgView2.layer removeAllAnimations];
    [_imgView3.layer removeAllAnimations];
    
    [self xj_init];
    [self xj_set2];
    [self xj_set3];
    
    [self performSelector:@selector(xj_reset) withObject:nil afterDelay:3];
}

- (void) xj_reset {
    [_imgView1.layer removeAllAnimations];
    [_imgView2.layer removeAllAnimations];
    [_imgView3.layer removeAllAnimations];
    
    CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.fillMode = kCAFillModeBackwards;
    animationGroup.beginTime = CACurrentMediaTime()  ;
    animationGroup.duration = 2;
    animationGroup.repeatCount = 1;
    animationGroup.timingFunction = defaultCurve;
    
    
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
    opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
    
    CABasicAnimation * scaleAnimationBig = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationBig.fromValue = @1.4;
    scaleAnimationBig.toValue = @2.5;
    
    animationGroup.animations = @[scaleAnimationBig, opacityAnimation];
    [_imgView1.layer addAnimation:animationGroup forKey:@"plulsing"];
    [_imgView2.layer addAnimation:animationGroup forKey:@"plulsing"];
    [_imgView3.layer addAnimation:animationGroup forKey:@"plulsing"];
}


- (void)xj_init {
     double animationDuration = 13;
    
//    [self.imgView1 setTransform:nil];
    
//    [self.view addSubview:self.imgView1];
    
    
    CABasicAnimation* rotationAnimation1;
    rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation1.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation1.duration = 3;
    rotationAnimation1.cumulative = YES;
    rotationAnimation1.repeatCount = 33;
//    [_imgView1.layer addAnimation:rotationAnimation1 forKey:@"rotationAnimation"];
    
    

    
    CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.fillMode = kCAFillModeBackwards;
    animationGroup.beginTime = CACurrentMediaTime()  ;
    animationGroup.duration = animationDuration;
    animationGroup.repeatCount = HUGE;
    animationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat: -(M_PI) ];
    scaleAnimation.toValue = [NSNumber numberWithFloat: M_PI * 4.0 ];
//    scaleAnimation.
    scaleAnimation.cumulative = YES;
    scaleAnimation.repeatCount = 33;
//    scaleAnimation.autoreverses = YES;
    scaleAnimation.duration = 5;
    
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@1, @0.95, @0.9, @0.85, @0.8, @0.75, @0.7, @0.6, @0.6, @0.6, @0.6];
//    opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
    
    CABasicAnimation * scaleAnimationBig = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimationBig.fromValue = @1.4;
//    scaleAnimationBig.toValue = @2.2;
    
    
    animationGroup.animations = @[scaleAnimation, opacityAnimation];
    [_imgView1.layer addAnimation:animationGroup forKey:@"plulsing"];
//    [_imgView1 addSublayer:pulsingLayer];
    
    
}

- (void)xj_set2{
    double animationDuration = 13;
 
    
    
    CABasicAnimation *momAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    momAnimation.fromValue = [NSNumber numberWithFloat:-4];
    momAnimation.toValue = [NSNumber numberWithFloat:4];
    momAnimation.duration = 5;
    momAnimation.repeatCount = CGFLOAT_MAX;
    momAnimation.autoreverses = YES;
    momAnimation.delegate = self;
    [self.imgView2.layer addAnimation:momAnimation forKey:@"animateLayer2"];
 
}

- (void)xj_set3{
    double animationDuration = 13;
    
    
    CABasicAnimation *momAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    momAnimation.fromValue = [NSNumber numberWithFloat: -(M_PI) ];
    momAnimation.toValue = [NSNumber numberWithFloat: M_PI * 4.0 ];
    momAnimation.duration =  5;
    momAnimation.repeatCount = CGFLOAT_MAX;
    momAnimation.autoreverses = YES;
    momAnimation.delegate = self;
    [self.imgView3.layer addAnimation:momAnimation forKey:@"animateLayer3"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise{
    
    
    
}


 /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
