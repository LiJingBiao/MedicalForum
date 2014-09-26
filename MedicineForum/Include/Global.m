//
//  Global.m
//  ShenFuPayBusinessVersions
//
//  Created by LiJingBiao on 14-8-13.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//

#import "Global.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "Reachability.h"

@implementation Global
NSString *MD5(NSString *string)
{
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

NSString *getSystemDateAndTimeWithFormatString(NSDate *date)
{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSUInteger unitFlag = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calender components:unitFlag fromDate:date];
    
    return [NSString stringWithFormat:@"%d%02d%02d:%02d%02d%02d", (int)[components year], (int)[components month], (int)[components day], (int)[components hour], (int)[components minute], (int)[components second]];
}
BOOL currentNetWorkStates(void)
{
    BOOL netWorkNormal = YES;
    Reachability *reachablity = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    switch ([reachablity currentReachabilityStatus]) {
        case NotReachable:
            netWorkNormal = NO;
            break;
            
        case ReachableViaWiFi: //wifi
            break;
            
        case ReachableViaWWAN: //3G
            break;
            
        default:
            break;
    }
    return netWorkNormal;
}

void showAlertViewWithMessage(NSString *message, NSString *confirm,NSString *cancel) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:confirm, nil];
    [alert show];
}
/*手机号码验证 MODIFIED BY HELENSONG*/
BOOL isValidateMobile(NSString *mobile)
{
    if (mobile.length != 11)
        return NO;
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

//身份证号
BOOL isValidateIdentityCard(NSString *identityCard)
{
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

BOOL isValidateEmail(NSString *email)
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
// 判断银行卡
BOOL isValidateBankCard(NSString *bankCard)
{
    NSString *cardRegex = @"/^\\d{16,19}$|^\\d{6}\\d{10,13}$|^\\d{4}\\d{4}\\d{4}\\d{4,7}$/";
    NSPredicate *bankTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cardRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [bankTest evaluateWithObject:bankCard];
}
@end
