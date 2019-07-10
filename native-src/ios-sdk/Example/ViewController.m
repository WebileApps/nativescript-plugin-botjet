//
//  ViewController.m
//  Example
//
//  Created by Rajiv Singaseni on 06/07/19.
//  Copyright © 2019 botjet.ai. All rights reserved.
//

#import "ViewController.h"
@import BotJetWebSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectOffset(button.frame, 100, 200);
    [button addTarget:self action:@selector(doClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
    
-(void)doClick:(id)sender {
    BJChatViewControllerOptions *config = [BJChatViewControllerOptions new];
    config.clientId = @"b-fe6ca16c-3f25-11e9-9d22-a08cfdd4254d";
    config.botId = @"97742ff7-a5aa-4ae3-b6b8-553b81399054";
    config.title = @"CallHealth Chat Bot";
    config.accentColor = @"#323b8c";
    config.isAnonymous = NO;
    config.isLocationRequired = NO;
    [self presentViewController:[BJWebSDK viewControllerWithConfig:config] animated:YES completion:nil];
}

@end
