//
//  AppDelegate.m
//  GitHub-Interaction
//
//  Created by Manish Verma on 31/03/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{

    NSString *value = [[[url.absoluteString componentsSeparatedByString:@"="] lastObject] stringByRemovingPercentEncoding];
    
    self.authCode =  value;
    
    if (url) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginSuccess" object:nil];
    }

    return YES;
}


#pragma mark- App's Common Methods
- (NSString *)convertToJSONString:(id)response
{
    NSError *error;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding] ;
    //    NSLog(@"JSONString====== %@", JSONString);
    
    return JSONString;
}

- (CGRect)getHeightOfText:(NSString*)text inFrame:(CGRect)textFrame withFont:(UIFont*)textFont
{
    return [text
            boundingRectWithSize:CGSizeMake(textFrame.size.width, MAXFLOAT)
            options:NSStringDrawingUsesLineFragmentOrigin
            attributes:@{
                         NSFontAttributeName : textFont
                         }
            context:nil];
}

@end
