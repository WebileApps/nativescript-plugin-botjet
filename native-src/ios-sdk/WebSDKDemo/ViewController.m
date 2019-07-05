//
//  ViewController.m
//  UIConstraintsDemo
//
//  Created by Rajiv Singaseni on 04/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#import "ViewController.h"
#import "BJWebSDK.h"
#import "BJChatViewControllerOptions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Launch Chat" style:UIBarButtonItemStylePlain target:self action:@selector(launchChat:)];
}

- (void)launchChat:(id)sender {
    BJChatViewControllerOptions *config = [[BJChatViewControllerOptions alloc] init];
    config.clientId = @"b-fe6ca16c-3f25-11e9-9d22-a08cfdd4254d";
    config.botId = @"97742ff7-a5aa-4ae3-b6b8-553b81399054";
    config.title = @"CallHealth Chat Bot";
    config.accentColor = @"#323b8c";
    config.isAnonymous = YES;
    UIViewController *viewController = [BJWebSDK viewControllerWithConfig:config];
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
