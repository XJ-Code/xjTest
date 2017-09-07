//
//  XJAnimationTianChongController.m
//  xjTest
//
//  Created by Leon on 2017/3/28.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import "XJAnimationTianChongController.h"

@interface XJAnimationTianChongController ()<CAAnimationDelegate>

@end

@implementation XJAnimationTianChongController
{
    UIImageView* image1;
    UIImageView* image2;
    UIImageView* image3;
    
    UIImageView* _unzanimg;
    UIImageView* _zanimg;
    UILabel* _addLaebl;
    
    BOOL _xjselected;
    BOOL _xjSelectedZan;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _xjselected = NO;
    _xjSelectedZan = NO;
    // Do any additional setup after loading the view.
    [self initViews];
//    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initViews {
    
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 100, 35, 18);
    [self.view addSubview:view];
    
    view.layer.cornerRadius = 9;
    view.layer.masksToBounds = YES;
    
    image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_3"]];
    image1.frame = CGRectMake(0, 0, 35, 18);
    [view addSubview:image1];
    
    image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_1"]];
    image2.frame = CGRectMake(0, 0, 18, 18);
    image2.center = CGPointMake(35/2, 18/2);
    [view addSubview:image2];
    
    image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_2"]];
    image3.frame = CGRectMake(0, 0, 18, 18);
    image3.center = CGPointMake(35/2, 18/2);
    [view addSubview:image3];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(cjcjcj) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(110, 220, 35, 18);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    
    //====  点赞
    UIButton* btnzan = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnzan addTarget:self action:@selector(cjcjcjdianzan) forControlEvents:UIControlEventTouchUpInside];
    btnzan.frame = CGRectMake(170, 220, 35, 18);
    [self.view addSubview:btnzan];
    btnzan.titleLabel.text = @"点赞";
    btnzan.backgroundColor = [UIColor redColor];
    
    
    UIView* bview = [[UIView alloc] init];
    bview.frame = CGRectMake(170, 100, 35, 35);
    [self.view addSubview:bview];
    
    _unzanimg = [[UIImageView alloc] init];
    _unzanimg.frame = CGRectMake(0, 0, 35, 35);
    [bview addSubview:_unzanimg];
    _unzanimg.image = [UIImage imageNamed:@"icon_1.1.4_good"];
    
    _zanimg = [[UIImageView alloc] init];
    _zanimg.image = [UIImage imageNamed:@"icon_1.1.5_good_pressed"];
    _zanimg.hidden = YES;
    [bview addSubview:_zanimg];
    _zanimg.frame = CGRectMake(0, 0, 25, 25);
    _zanimg.center = CGPointMake(35/2, 35/2);
    
    
    _addLaebl = [[UILabel alloc] init];
    _addLaebl.text = @"+1";
    _addLaebl.textColor = [UIColor redColor];
    _addLaebl.font = [UIFont systemFontOfSize:12];
    _addLaebl.textAlignment = NSTextAlignmentCenter;
    _addLaebl.frame = CGRectMake(0, 0, 8, 8);
    [_addLaebl sizeToFit];
    _addLaebl.hidden = YES;
    _addLaebl.center = CGPointMake(35/2, 35/2);
    [bview addSubview:_addLaebl];
    
    
}

- (void)cjcjcj {
    
    _xjselected = !_xjselected;
//    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
//    opacityAnimation.values = @[@1.6, @2.8, @3.9, @1.0, @1.2, @1.4, @1.6];
//    opacityAnimation.duration = 2.0f;
//    [image2.layer addAnimation:opacityAnimation forKey:@"opacity"];
    
    CABasicAnimation * scaleAnimationBig = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationBig.fromValue = @1.4;
    scaleAnimationBig.toValue = @2.5;
    scaleAnimationBig.delegate = self;
    scaleAnimationBig.repeatCount = 0;
    scaleAnimationBig.removedOnCompletion = NO;
    scaleAnimationBig.fillMode=kCAFillModeForwards;
    
    CABasicAnimation * scaleAnimationSmall = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationSmall.fromValue = @2.5;
    scaleAnimationSmall.toValue = @0.4;
//    scaleAnimationSmall.delegate = self;
    scaleAnimationSmall.repeatCount = 0;
    scaleAnimationSmall.removedOnCompletion = NO;
    scaleAnimationSmall.fillMode=kCAFillModeForwards;
    
    
    if (_xjselected) {
        [image2.layer addAnimation:scaleAnimationBig forKey:@"transform.scale"];
    } else {
        [image2.layer addAnimation:scaleAnimationSmall forKey:@"transform.scale"];
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
     _addLaebl.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cjcjcjdianzan {
    
    _xjSelectedZan = !_xjSelectedZan;
    CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.fillMode = kCAFillModeBackwards;
    animationGroup.beginTime = CACurrentMediaTime()  ;
    animationGroup.duration = 1;
    animationGroup.repeatCount = 0;
//    animationGroup.timingFunction = defaultCurve;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    
    
    CABasicAnimation * scaleAnimationBig = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationBig.fromValue = @1.4;
    scaleAnimationBig.toValue = @2.5;
    scaleAnimationBig.delegate = self;
    scaleAnimationBig.repeatCount = 0;
    scaleAnimationBig.removedOnCompletion = NO;
    scaleAnimationBig.fillMode=kCAFillModeForwards;
    
    //移动
    /*
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 10;
    //Lets loop continuously for the demonstration
    pathAnimation.repeatCount = 10;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, 10, 10);
//    CGPathAddQuadCurveToPoint(curvedPath, NULL, 10, 450, 310, 450);
//    CGPathAddQuadCurveToPoint(curvedPath, NULL, 310, 10, 10, 10);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
     */
    
    //位置移动
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue =  [NSValue valueWithCGPoint: _addLaebl.layer.position];
//    animation.
    CGPoint toPoint = _addLaebl.layer.position;
    toPoint.y -= 50;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    animation.repeatCount = 0;
    animation.duration = 0.8;
    
    //dimis
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0];
    opacityAnimation.removedOnCompletion=NO;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.duration=1;
    
    animationGroup.animations = @[opacityAnimation, animation];
    

    
    //控制 _unzanimg 隐藏
    
    _unzanimg.hidden = _xjSelectedZan;
    _zanimg.hidden  = !_xjSelectedZan;
    _addLaebl.hidden = !_xjSelectedZan;
    
    if (_xjSelectedZan) {
//        [_zanimg.layer addAnimation:scaleAnimationBig forKey:@"transform.scale"];
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
//            [_zanimg.layer addAnimation:scaleAnimationBig forKey:@"transform.scale"];
            _zanimg.frame = CGRectMake(0, 0, 35, 35);
        } completion:^(BOOL finished) {
            
        }];
        [_addLaebl.layer addAnimation:animationGroup forKey:@"jjj"];
    } else {
        _zanimg.frame = CGRectMake(0, 0, 5, 5);
        _zanimg.center = CGPointMake(35/2, 35/2);
    }
//      _zanimg
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
