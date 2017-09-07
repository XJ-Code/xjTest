//
//  XJFLFirstScanViewController.h
//  XJFreeLaAR
//
//  Created by Leon on 2017/3/1.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJFLFirstScanViewController : UIViewController
/**
 * 是否监听设备移动
 */
@property (nonatomic) BOOL isWatchDeveiceMove;

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
- (instancetype)initWithKey:(NSString*)key;
@end
