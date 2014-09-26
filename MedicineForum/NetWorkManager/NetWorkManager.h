//
//  NetWorkManager.h
//  MedicineForum
//
//  Created by LiJingBiao on 14-9-23.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//
#import "MKNetworkKit.h"
#import <Foundation/Foundation.h>

#define HOST_NAME @"114.141.132.88:8081" 
typedef void(^handleRequest)(id result, NSError *error);

@interface NetWorkManager : NSObject

@end
