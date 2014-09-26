//
//  Global.h
//  ShenFuPayBusinessVersions
//
//  Created by LiJingBiao on 14-8-13.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject
//MD5加密
NSString *MD5(NSString *handleString);
NSString *getSystemDateAndTimeWithFormatString(NSDate *date);
//获取当前的网络状态
BOOL currentNetWorkStates(void);
void showAlertViewWithMessage(NSString *message, NSString *confirm,NSString *cancel);
// 判断一个号码是否为手机号码
BOOL isValidateMobile(NSString *mobile);

// 判断一个身份证号码是否合法
BOOL isValidateIdentityCard(NSString *identityCard);

// 判断是否一个合法的邮箱
BOOL isValidateEmail(NSString *email);
//判断是否为一个合法的银行卡号
BOOL isValidateBankCard(NSString *bankNo);
@end
