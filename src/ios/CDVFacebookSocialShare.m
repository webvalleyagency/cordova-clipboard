#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>
#import "CDVFacebookSocialShare.h"

@implementation CDVFacebookSocialShare

- (void)share:(CDVInvokedUrlCommand*)command {

  // Verify app can open custom URL scheme, open if able
  NSURL *urlScheme = [NSURL URLWithString:@"facebook-stories://share"];
  if ([[UIApplication sharedApplication] canOpenURL:urlScheme]) {

        // Parse Data from Command
        NSString     *appId                 = [command.arguments objectAtIndex:0];
        NSString     *backgroundImage       = [command.arguments objectAtIndex:1];

        // Assign background image asset to pasteboard
        NSArray *pasteboardItems = @[@{@"com.facebook.sharedSticker.backgroundImage" : backgroundImage,
                                       @"com.facebook.sharedSticker.appID" : appID}];
        NSDictionary *pasteboardOptions = @{UIPasteboardOptionExpirationDate : [[NSDate date] dateByAddingTimeInterval:60 * 5]};
        // This call is iOS 10+, can use 'setItems' depending on what versions you support
        [[UIPasteboard generalPasteboard] setItems:pasteboardItems options:pasteboardOptions];

        [[UIApplication sharedApplication] openURL:urlScheme options:@{} completionHandler:nil];

        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:text];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  } else {
      // Handle older app versions or app not installed case
  }
}

@end
