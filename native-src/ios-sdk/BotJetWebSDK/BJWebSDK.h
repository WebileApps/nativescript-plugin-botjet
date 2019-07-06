//
//  BJWebSDK.h
//  ios-sdk
//
//  Created by Rajiv Singaseni on 03/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BJChatViewControllerOptions.h"

NS_ASSUME_NONNULL_BEGIN

@interface BJWebSDK : NSObject

+(UIViewController *)viewControllerWithConfig:(BJChatViewControllerOptions *)config;

@end

NS_ASSUME_NONNULL_END
