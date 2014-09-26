//
//  BaseViewController.m
//  MedicineForum
//
//  Created by LiJingBiao on 14-9-23.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *titileLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titileLabel.text = title;
    titileLabel.textColor = [UIColor whiteColor];
    titileLabel.backgroundColor = [UIColor clearColor];
    [titileLabel sizeToFit];
    self.navigationItem.titleView = titileLabel;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *imageBG = nil;
    if (IOS_VERSION >= 5.0)
    {
        //        imageBG = [[UIImage imageNamed:@"navBar_ios6"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        //        [self.navigationController.navigationBar setBackgroundImage:imageBG forBarMetrics:UIBarMetricsDefault];
        
        if ((IOS_VERSION >= 6.0) && (IOS_VERSION < 7.0))
        {
            imageBG = [[UIImage imageNamed:@"navBar_ios6"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            [self.navigationController.navigationBar setBackgroundImage:imageBG forBarMetrics:UIBarMetricsDefault];
            self.navigationItem.hidesBackButton = YES;
            
        }
        else if (IOS_VERSION >= 7.0)
        {
            imageBG = [[UIImage imageNamed:@"navBarBG"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            
            [self.navigationController.navigationBar setBackgroundImage:imageBG forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.automaticallyAdjustsScrollViewInsets = NO;
            
        }
    }
    if (self.navigationController.viewControllers.count>1) {
        [self _initLeftItem];
    }
  
}
- (void)_initLeftItem
{
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbtn setImage:[UIImage imageNamed:@"leftBtn"] forState:UIControlStateNormal];
    [leftbtn sizeToFit];
    [leftbtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(AppDelegate *)appDelegate
{
    AppDelegate *delegate =(AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate;
}
@end
