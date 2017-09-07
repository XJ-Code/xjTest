//
//  XJOpenCVViewController.h
//  xjTest
//
//  Created by Leon on 2017/1/16.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <opencv2/opencv.hpp>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/videoio/cap_ios.h>

using namespace cv;
using namespace std;


@interface XJOpenCVViewController : UIViewController
@property (strong , nonatomic)  UIImageView *imageView;
@property CvVideoCamera *videoCamera;

@end
