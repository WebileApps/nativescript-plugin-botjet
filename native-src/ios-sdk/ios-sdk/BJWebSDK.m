//
//  BJWebSDK.m
//  ios-sdk
//
//  Created by Rajiv Singaseni on 03/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#import "BJWebSDK.h"
#import "BJChatViewController.h"

@implementation BJWebSDK

+(UIViewController *)viewControllerWithConfig:(BJChatViewControllerOptions *)config {
    return [[BJChatViewController alloc] initWithConfig:config];
}


@end
