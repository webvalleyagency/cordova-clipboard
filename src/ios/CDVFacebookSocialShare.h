#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVFacebookSocialShare : CDVPlugin {}

- (void)share:(CDVInvokedUrlCommand*)command;

@end