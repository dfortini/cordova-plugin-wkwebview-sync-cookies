#import "WKWebViewSyncCookies.h"
#import <Cordova/CDV.h>

@implementation WKWebViewSyncCookies

- (void)sync:(CDVInvokedUrlCommand *)command {
  @try {
    NSString *urlHttpMethod = command.arguments[0];
    NSString *urlString = command.arguments[1];
    NSString *body = command.arguments[2];
    NSURL *url = [NSURL URLWithString:urlString];

    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:urlHttpMethod];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[body length]] forHTTPHeaderField:@"Content-Length"];

    NSURLSession *urlSession = [NSURLSession sharedSession];

    [[urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable urlResponse, NSError * _Nullable error) {
      CDVPluginResult *result;
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
      if (error) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
      } else {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:dataString];
      }

      [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }] resume];
  }
  @catch (NSException *exception) {
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
  }
}

@end
