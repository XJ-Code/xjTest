//
//  XJSDKTestViewController.m
//  xjTest
//
//  Created by Leon on 2017/2/20.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import "XJSDKTestViewController.h"
//#import <XJFLFreeLaAR/XJFLFreeLaAR.h>
#import <XJFreeLaAR/XJFreeLaAR.h>
#import "WMPlayer.h"

@interface XJSDKTestViewController ()
@property (nonatomic , strong) WMPlayer* palyer;

@end

@implementation XJSDKTestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 40);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(xjtest) forControlEvents:UIControlEventTouchUpInside];
    
}

- (WMPlayer *)palyer {
    if (!_palyer) {
        _palyer = [[WMPlayer alloc] initWithFrame:CGRectMake(100, 100, 400, 300) videoURLStr:@"http://7xl1ve.com5.z0.glb.clouddn.com/sdkvideo/EasyARSDKShow201520.mp4"];
    }
    return _palyer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)xjtest {
//    XJTestViewController * ccc = [[XJTestViewController alloc] initWithKey:@"f6011ddf275dc127686a474ca46f22c0" tableId:@"58ab9e2d7bbf195ae865d7cd"];
//    //gai  key  8ecb5425ec5fae279934cfc30250c89b
//    
//    XJFLFirstScanViewController* vvv = [[XJFLFirstScanViewController alloc] initWithKey:@"55cb09a654cc40d5be0fef77a8bd365d"];
//
//    
//    
//    [self.navigationController pushViewController:vvv animated:YES];
    
//    XJVersionTPickSuccessView* view = [[XJVersionTPickSuccessView alloc] initWithFrame:CGRectMake(0, 0, FLUISCREENBOUNDS.width, FLUISCREENBOUNDS.height)];
//    
//    [view  xj_findGiftSuccessDone:^{
//        [view removeFromSuperview];
//    }];
    
//    [self.view addSubview:self.palyer];
    NSURL* url = [NSURL URLWithString:@"http://www.qccr.com/semsale/20160629/NewOldUserHundred/index.shtml?redbagcode=9eda95e50d034809ad29b96746cc15cb"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.qccr.com/semsale/20160629/NewOldUserHundred/index.shtml?redbagcode=9eda95e50d034809ad29b96746cc15cb"]];
    }
    
    
 
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
