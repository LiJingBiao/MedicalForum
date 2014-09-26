//
//  BaseViewController.h
//  MedicineForum
//
//  Created by LiJingBiao on 14-9-23.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//
#import "AppDelegate.h"
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
-(AppDelegate *)appDelegate;
- (void)popViewController;
@end
