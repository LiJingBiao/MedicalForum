//
//  SHConsdef.h
//  shMetro3.0
//
//  Created by syzhou on 13-4-12.
//  Copyright (c) 2013年 syzhou. All rights reserved.
//

#ifndef Tutor_YTConsdef_h
#define Tutor_YTConsdef_h

#define UI @"UI"

#define kSystemLanguage @"SystemLanguage"
#define kChinese @"Chinese"
#define kEnglish @"English"

#define kDefaultCity @"DefaultCity"

#define kYear @"year"
#define kMonth @"month"
#define kDay @"day"
#define kWeek @"week"

#define kUserName @"loginName"
#define kPassword @"loginPassword"

#define kKSN @"ksn"
#define kSN @"sn"
#define kCardNo @"cardNo"
#define kRandomNumber @"randomNumber"
#define kTrack2 @"track2"
#define kTrack3 @"track3"
#define kPassWord @"password"
#define kAmount @"amount"
#define kMacValue @"macValue"
#define kConsumType @"consumType"
#define kPosType @"posType"
#define kLogNo @"logNo"
#define kAccountTransferIn @"accountTransferIn"
#define kAccountName @"accountName"
#define kUserId @"userId"
#define kShopId @"shopId"

#define kNotificationDealFinished @"notificationDealFinished"
#define kNotificationTransferFinished @"notificationTransferFinished"

#define kLoading_info @"正在请求数据，请稍候"
#define kRequest_error @"网络不给力，请稍候重试"

#define kOrderCellFont [UIFont systemFontOfSize:15]

#define TOP_STATUS_BAR_HEIGHT (IOS7 ? Status_Bar_Height : 0)
#define Nav_Left_BarItem_Offset (IOS7 ? -10.0f : -5.0f)
#define Nav_Right_BarItem_Offset (IOS7 ? -10.0f : -5.0f)
#define Navigation_Bar_Animaiton_Interval 0.5


#define buttonStateSelectColor RGB(233, 93, 23)
#define buttonStateUnselectColor RGB(128, 130, 129)


#define BorderColor RGB(204.0, 204.0, 204.0)
#define BarColor RGBCOLOR(70,149,0);
#define TextDefaultColor RGB(102, 102, 102)

#define kAutoLogin @"autoLogin"

#define BASE_URL @"http://114.141.132.75/SFPayOnLine/api/"
#define IMAGE_HOST @"http://114.141.132.88:8081/sign/"

#define kDeviceTypeBlueAudio @"02"
#define kDeviceTypeDia @"1"
#define kDeviceTypePort @"2"
#define kDeviceTypeBluetooth @"4"
#define kDeviceTypeAudio @"5"

///determine iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define Nav_Bar_Height 44.0f
///frame of iphone 5
#define iPhone5_F_S_Frame CGRectMake(0 , 0, 320, 568)               //full screen frame
#define iPhone5_Nav_Content_Frame CGRectMake(0, 0, 320, 504)        //frame of navigation content

///frame of iphone 4
#define iPhone4_F_S_Frame CGRectMake(0, 0, 320, 480)                //full screen
#define iPhone4_Nav_Content_Frame CGRectMake(0, 0, 320, 416)        //frame of navigation content

#define Full_Screen_Width 320.0f
#define Full_Screen_Height (iPhone5 ? iPhone5_F_S_Frame.size.height : iPhone4_F_S_Frame.size.height)
#define Full_Screen_Frame (iPhone5 ? iPhone5_F_S_Frame : iPhone4_F_S_Frame)

#define Image_Name(name) (iPhone5 ? [NSString stringWithFormat:@"%@-568h@2x.png",name] : [NSString stringWithFormat:@"%@.png",name])
#define Image_Name_JPG(name) (iPhone5 ? [NSString stringWithFormat:@"%@-568h@2x.jpg",name] : [NSString stringWithFormat:@"%@.jpg",name])

#define COMPRESSION_RATIO 0.6
#define AVATAR_LARGE_SIZE CGSizeMake(301, 301)
#define AVATAR_SMALL_SIZE CGSizeMake(60, 60)
#define MOMENT_SMALL_SIZE CGSizeMake(200, 200)

#define kGetKSNNotification @"getKSNNotfication"

#endif
