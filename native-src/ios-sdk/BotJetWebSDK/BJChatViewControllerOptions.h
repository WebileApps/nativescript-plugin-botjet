//
//  BJChatViewControllerOptions.h
//  ios-sdk
//
//  Created by Rajiv Singaseni on 04/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#ifndef BJChatViewControllerOptions_h
#define BJChatViewControllerOptions_h
@interface BJChatViewControllerOptions : NSObject

@property (nonatomic, strong) NSString *botId;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) BOOL isAnonymous;
@property (nonatomic) BOOL isLocationRequired;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *senderId;
@property (nonatomic, strong) NSDictionary *profileMeta;
@property (nonatomic, strong) NSString *botIcon;
@property (nonatomic, strong) NSString *accentColor;

-(NSString *)configJSON;

@end
#endif /* BJChatViewControllerOptions_h */
