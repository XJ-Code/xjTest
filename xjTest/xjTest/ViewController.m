//
//  ViewController.m
//  MAMapKit_3D_Demo
//
//  Created by 翁乐 on 8/9/16.
//  Copyright © 2016 Autonavi. All rights reserved.
//

#import "ViewController.h"
#define MainViewControllerTitle @"测试专用"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _mainTableView;
    NSArray     * _titles;
    NSArray     * _detailTitles;
    NSArray     * _className;
}

@end

@implementation ViewController


#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = _className[indexPath.section];
    
    UIViewController *subViewController = [[NSClassFromString(className) alloc] init];
    subViewController.title = _titles[indexPath.section];
    
    [self.navigationController pushViewController:subViewController animated:YES];
}

#pragma mark - tableView DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_titles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mainCellIdentifier = @"com.autonavi.mainCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = _titles[indexPath.section];
    
    cell.detailTextLabel.text = _detailTitles[indexPath.section];
    
    return cell;
}


#pragma mark - init
- (void)initTitles
{
    ///主页面标签title
    _titles = @[@"图片对比",
                @"圆圈动画",
                @"openCV",
                @"免费啦界面测试",
                @"图片叠加",
                @"摄像头拍照",
                @"SDK测试",
                @"填充小动画",
                ];
}

- (void)initDetalTitles
{
    ///标签描述
    _detailTitles = @[@"..",
                      @"......",
                      @"使用openCV对比图片",
                      @"更方便的解决界面适配问题",
                       @"",
                      @"摄像头拍照",
                      @"哎呀我的天",
                      @"",
                      ];
}

- (void)initClassName
{
    ///标签目标类
    _className = @[@"XJViewController",
                   @"XJCirckeAnimationViewController",
                   @"XJOpenCVViewController",
                   @"XJFreelaTestViewController",
                   @"XJImageAddImageViewController",
                   @"XJAVCaptureViewController",
                   @"XJSDKTestViewController",
                   @"XJAnimationTianChongController"
                   ];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = MainViewControllerTitle;
    
    [self initTitles];
    [self initDetalTitles];
    [self initClassName];
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _mainTableView.sectionHeaderHeight = 10;
    _mainTableView.sectionFooterHeight = 0;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    [self.view addSubview:_mainTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController setToolbarHidden:YES animated:animated];
}

@end
