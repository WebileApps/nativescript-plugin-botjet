//
//  BJChatViewController.m
//  ios-sdk
//
//  Created by Rajiv Singaseni on 04/07/19.
//  Copyright © 2019 Rajiv Singaseni. All rights reserved.
//

#import "BJChatViewController.h"
#import <WebKit/WebKit.h>

@interface BJChatViewController () <UINavigationBarDelegate, WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate, WKScriptMessageHandler>


@property(nonatomic, strong) BJChatViewControllerOptions* options;
@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UINavigationBar *navigationBar;
@end

@implementation BJChatViewController

-(instancetype)initWithConfig:(BJChatViewControllerOptions *)config {
    self = [super init];
    if (self != nil) {
        self.options = config;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // --- Add NavigationBar
    UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectZero];
    self.navigationBar = navbar;
    [self.view addSubview:self.navigationBar];
    navbar.translatesAutoresizingMaskIntoConstraints = NO;
    if (@available(iOS 11.0, *)) {
        UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
        [NSLayoutConstraint activateConstraints:@[
                                                  [navbar.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor],
                                                  [navbar.topAnchor constraintEqualToAnchor:guide.topAnchor],
                                                  [navbar.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor]
                                                  ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[
                                                  [navbar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                                  [navbar.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                                                  [navbar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
                                                  ]];
    }
    
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"24/7 Chat Support"];
    navItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"End Chat" style:UIBarButtonItemStylePlain target:self action:@selector(closeChat:)];
    
    navbar.items = @[navItem];
    navbar.delegate = self;
    // --- End Add NavigationBar
    
    // --- Add Webview
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    self.webView = webView;
    [self.view addSubview:self.webView];
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    if (@available(iOS 11.0, *)) {
        UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
        [NSLayoutConstraint activateConstraints:@[
                                                  [webView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor],
                                                  [webView.topAnchor constraintEqualToAnchor:navbar.bottomAnchor],
                                                  [webView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor],
                                                  [webView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
                                                  ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[
                                                  [webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                                  [webView.topAnchor constraintEqualToAnchor:navbar.bottomAnchor],
                                                  [webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                                  [webView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
                                                  ]];
    }
    
    // --- End Add Webview
    
    // -- Configure Webview
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    webView.scrollView.delegate = self;
    [webView.configuration.userContentController addScriptMessageHandler:self name:@"jsHandler"];
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];

    NSURL *url = [frameworkBundle URLForResource:@"sdk-index" withExtension:@"html"];
    [webView loadFileURL:url allowingReadAccessToURL:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60.f];
    [webView loadRequest:request];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBar.topItem.title = self.options.title?:@"24/7 Chat Support";
}

-(void)closeChat:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return nil;
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        NSURL *url = navigationAction.request.URL;
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *js = [NSString stringWithFormat:@"init('%@');", [self.options configJSON]];
    [webView evaluateJavaScript:js completionHandler:nil];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"createFCMToken"]) {
        NSString *jsMessage = message.body;
        NSArray *jsMss = [jsMessage componentsSeparatedByString:@"~~~~"];
        NSString *profileId = jsMss[0];
        NSString *accessToken = jsMss[1];
        NSLog(@".... %@ %@", profileId, accessToken);
    } else if ([message.name isEqualToString:@"onJoinServer"]) {
        NSLog(@".... onJoinServer");
    }
}

@end
