//
//  AppDelegate.h
//  xjTest
//
//  Created by Leon on 2016/10/17.
//  Copyright © 2016年 FreeLa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

