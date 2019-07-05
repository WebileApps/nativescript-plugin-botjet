//
//  BJChatViewController.h
//  ios-sdk
//
//  Created by Rajiv Singaseni on 04/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BJChatViewControllerOptions.h"

NS_ASSUME_NONNULL_BEGIN

@interface BJChatViewController : UIViewController

@property(nonatomic, readonly) BJChatViewControllerOptions* options;

-(instancetype)initWithConfig:(BJChatViewControllerOptions *)config;

@end

NS_ASSUME_NONNULL_END
