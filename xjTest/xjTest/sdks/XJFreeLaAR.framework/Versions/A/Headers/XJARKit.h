//
//  XJARKit.h
//  XJFreeLaAR
//
//  Created by Leon on 2017/3/3.
//  Copyright © 2017年 FreeLa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJARKit : NSObject

+ (XJARKit*)shareKit;

/**
 *  APIkey。设置key，需要绑定对应的bundle id。
 */
@property (nonatomic, copy) NSString *apiKey;


@end
