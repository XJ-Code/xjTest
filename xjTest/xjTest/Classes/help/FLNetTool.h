//
//  FLNetTool.h
//  FreeLa
//
//  Created by 楚志鹏 on 15/10/20.
//  Copyright © 2015年 FreeLa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FLHTTPRequestTool.h"
//#import <SMS_SDK/SMSSDK.h>

@interface FLNetTool : NSObject

+ (void)xjUploadTWDetailImage: (UIImage *)image success:(void(^)(NSDictionary *data))success failure: (void(^)(NSError *error))failure;
@end























