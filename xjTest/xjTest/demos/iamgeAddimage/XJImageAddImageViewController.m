//
//  XJImageAddImageViewController.m
//  xjTest
//
//  Created by Leon on 2017/1/18.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import "XJImageAddImageViewController.h"

@interface XJImageAddImageViewController ()
@property (nonatomic , strong) UIImageView* xjimgView;

@end

@implementation XJImageAddImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.xjimgView = [[UIImageView alloc] init];
    self.xjimgView.frame = CGRectMake(0, 0, FLUISCREENBOUNDS.width, FLUISCREENBOUNDS.height);
    [self.view addSubview:self.xjimgView];
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    
    imgView.image = [self addImage:@"bbb" withImage:@"img1"];
    
    
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imgView];
    
    
    
}

- (UIImage *)addImage:(NSString *)imageName1 withImage:(NSString *)imageName2 {
    
    UIImage *image1 = [UIImage imageNamed:imageName1];
    UIImage *image2 = [UIImage imageNamed:imageName2];
    
    UIGraphicsBeginImageContext(image1.size);
    
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    
    [image2 drawInRect:CGRectMake((image1.size.width - image2.size.width)/2,(image1.size.height - image2.size.height)/2, image2.size.width, image2.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
