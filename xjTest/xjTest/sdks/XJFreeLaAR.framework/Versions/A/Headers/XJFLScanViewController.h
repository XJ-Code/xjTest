//
//  XJFLScanViewController.h
//  XJFreeLaAR
//
//  Created by Leon on 2017/2/15.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

@interface XJFLScanViewController : UIViewController
/**
 * 是否监听设备移动
 */
@property (nonatomic) BOOL isWatchDeveiceMove;

@property (nonatomic, strong) AMapCloudPOI *poi;

/**
 * 比对成功厚的回调方法
 */
- (void)xjCompareImgSuccess;
/**
 * 重新扫描
 */
- (void)xjReScan;

/**
 *  初始化方法
 */
- (instancetype)init;



@end
