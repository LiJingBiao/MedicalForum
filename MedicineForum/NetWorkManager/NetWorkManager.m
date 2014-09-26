//
//  NetWorkManager.m
//  MedicineForum
//
//  Created by LiJingBiao on 14-9-23.
//  Copyright (c) 2014年 LiJingBiao. All rights reserved.
//

#import "NetWorkManager.h"

@implementation NetWorkManager

//一般环境
+ (MKNetworkEngine *)netWorkEngine
{
    static MKNetworkEngine *netWorkEnginSingle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorkEnginSingle = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME];
    });
    return netWorkEnginSingle;
}


+ (void)netWorkWithPath:(NSString*)path andHandle:(handleRequest)completeHandler params:(NSDictionary*)params
{
    MKNetworkOperation *newWorkOpenration = [[NetWorkManager netWorkEngine] operationWithPath:path params:params httpMethod:@"POST"];
    [newWorkOpenration addCompletionHandler:^(MKNetworkOperation *completedOpentedOpenration){
        
        completeHandler(completedOpentedOpenration.responseJSON, nil);
    } errorHandler:^(MKNetworkOperation* completedOperation, NSError* error){
        //[SVProgressHUD dismiss];
        //[SVProgressHUD showErrorWithStatus:@"请检查网络状态"];
        completeHandler(completedOperation.responseJSON, error);
    }];
    
    [[NetWorkManager netWorkEngine] enqueueOperation:newWorkOpenration];
}

@end
