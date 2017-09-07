//
//  FLNetTool.m
//  FreeLa
//
//  Created by 楚志鹏 on 15/10/20.
//  Copyright © 2015年 FreeLa. All rights reserved.
//

#import "FLNetTool.h"
#import "AFNetworking.h"

#define cuizhihuaurl   @"http://192.168.20.151:8888"
#define guangxiongurl  @"http://192.168.20.55:8080"

#define FL_AF_GOODWORK  mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];

@implementation FLNetTool

+ (void)xjUploadTWDetailImage: (UIImage *)image success:(void(^)(NSDictionary *data))success failure: (void(^)(NSError *error))failure {
    
    NSData* imageData = UIImageJPEGRepresentation(image, 1.0f);
    NSString* requestStr = [[NSString stringWithFormat:@"%@/app/users!uploadPicture.action?",FLBaseUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [FLHTTPRequestTool postWithURL:requestStr params:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString* str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png",str];
        [formData appendPartWithFileData:imageData name:@"imagefile" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(id json) {
        success(json);
        //        NSLog(@"responseObject=%@%",json);
    } failure:^(NSError *error) {
        failure(error);
        NSLog(@"222error= %@ = %@",error.description,error.debugDescription);
    }];
}

@end











