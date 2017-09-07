//
//  XJFinalTool.h
//  xjTest
//
//  Created by Leon on 2017/2/4.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJFinalTool : NSObject
/**
 * 返回一个不转向的img
 */
+ (UIImage *)xj_fixOrientation:(UIImage *)aImage;
@end
