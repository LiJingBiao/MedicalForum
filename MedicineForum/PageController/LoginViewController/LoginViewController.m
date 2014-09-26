//
//  LoginViewController.m
//  MedicineForum
//
//  Created by LiJingBiao on 14-9-24.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    BOOL isShow;
    UIImageView *imageView;
}
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isShow = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.view.backgroundColor = [UIColor redColor];
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Loading_checkAmount_5_img"]];
    imageView.backgroundColor = [UIColor orangeColor];
    //self.view.intrinsicContentSize
    [self.view addSubview:imageView];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary =NSDictionaryOfVariableBindings(self.view,imageView);
    NSString *RL = @"H:|-0-[imageView]-0-|";
    NSString *TB = @"V:|-0-[imageView]-0-|";
    NSArray *LRConstraint = [NSLayoutConstraint constraintsWithVisualFormat:RL options:0 metrics:nil views:viewsDictionary];
    NSArray *TBConstraint = [NSLayoutConstraint constraintsWithVisualFormat:TB options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:LRConstraint];
    [self.view addConstraints:TBConstraint];
    
    NSLog(@"self.view:%d",self.view.constraints.count);
    /*
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self.view addConstraints:@[constraintTop,constraintBottom,constraintLeft,constraintRight]];
     */
    //[self.view layoutIfNeeded];
    //[self.view setNeedsLayout];

    
    [self performSelector:@selector(showStateBar) withObject:nil afterDelay:3];
    
}
-(void)showStateBar
{
    if (imageView.superview) {
        //[imageView removeFromSuperview];
        [UIView animateWithDuration:.5 animations:^{
        [self.view removeConstraints:self.view.constraints];
        NSDictionary *viewsDictionary =NSDictionaryOfVariableBindings(self.view,imageView);
        NSString *RL = @"H:|-20-[imageView]-20-|";
        NSString *TB = @"V:|-50-[imageView]-50-|";
        NSArray *LRConstraint = [NSLayoutConstraint constraintsWithVisualFormat:RL options:0 metrics:nil views:viewsDictionary];
        NSArray *TBConstraint = [NSLayoutConstraint constraintsWithVisualFormat:TB options:0 metrics:nil views:viewsDictionary];
        
        
             //[self.view setNeedsLayout];
            [self.view addConstraints:LRConstraint];
            [self.view addConstraints:TBConstraint];
            [self.view layoutIfNeeded];
        }];
       
        
    }
    isShow = NO;
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self setNeedsStatusBarAppearanceUpdate];
    }else
    {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }

}
#ifdef __IPHONE_7_0

- (BOOL)prefersStatusBarHidden
{
    return isShow;
}
#endif
@end
