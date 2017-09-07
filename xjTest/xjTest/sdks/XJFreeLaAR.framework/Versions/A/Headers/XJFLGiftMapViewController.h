//
//  XJFLGiftMapViewController.h
//  XJFreeLaAR
//
//  Created by Leon on 2017/2/19.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJFLGiftMapViewController : UIViewController
/**
 * 地图的天空图片
 */
@property (nonatomic , strong) UIImage* xjMapSkyImg;




/**
 * 礼包地图的初始化方法(此初始化方法针对未接入高德的用户，key可以自行在高德 官网申请或者在免费啦后台申请)
 * 
 * @param  key      高德地图KEY
 * @param  tableid  高德地图tableid
 */
- (instancetype)initWithMapKEY:(NSString*)key tableid:(NSString*)tableid;
/**
 * 礼包地图的初始化方法(此初始化方法针对已接入高德的用户)
 *
 * @param  key      高德地图KEY
 */
- (instancetype)initWithMapKEY:(NSString*)key;
/**
 * 修改地图的天空图片
 *
 * @param  img      图片
 */
- (void)xjChangeMapSkyWithImg:(UIImage*)img;
/**
 * 修改地图的天空图片
 *
 * @param  color    颜色
 */
- (void)xjChangeMapColor:(UIColor*)color;











@end







