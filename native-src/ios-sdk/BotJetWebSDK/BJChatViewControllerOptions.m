//
//  BJChatViewControllerOptions.m
//  ios-sdk
//
//  Created by Rajiv Singaseni on 05/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BJChatViewControllerOptions.h"

@implementation BJChatViewControllerOptions

- (instancetype)init {
    return [super init];
}

-(NSString *)configJSON {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"clientId": self.clientId, @"botId" : self.botId}];
    
    dict[@"title"] = self.title ?:@"24/7 Chat Support";
    dict[@"isAnonymous"] = @(self.isAnonymous?:NO);
    dict[@"isLocationRequired"] = @(self.isLocationRequired?:YES);
    dict[@"botIcon"] = self.botIcon?:@"https://image.icons8.com/?id=32439&format=png&size=32&color=000000";
    dict[@"accentColor"] = self.accentColor?:@"#009EFF";
    dict[@"host"] = self.host?:@"https://qa.botjet.ai";
    dict[@"profileMeta"] = self.profileMeta?:@{@"firstName" : @"Guest", @"deviceId": @"ecd94f2f53afca19"};
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if (error != nil) {
        NSLog(@"Could not parse config %@",error);
        NSException* myException = [NSException
                                    exceptionWithName:@"ConfigSerializationException"
                                    reason:error.description
                                    userInfo:nil];
        @throw myException;
    }
    NSString *config = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"config %@", config);
    return config;
}

@end
