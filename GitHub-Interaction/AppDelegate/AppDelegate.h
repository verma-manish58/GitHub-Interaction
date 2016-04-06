//
//  AppDelegate.h
//  GitHub-Interaction
//
//  Created by Manish Verma on 31/03/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import <UIKit/UIKit.h>



#define APPDELEGATE         ((AppDelegate*)[UIApplication sharedApplication].delegate)

#define  STORYBOARD         [UIStoryboard storyboardWithName:@"Main" bundle: nil]


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  UAGithubEngine: Wrapper classes for accessing GitHub API
 */
@property (retain, nonatomic) UAGithubEngine *engine;

/**
 *  Selected Repo
 */
@property (retain, nonatomic) Repository *selectedRepo;

/**
 *  Code returned by github.com as part of the OAuth
 */
@property (copy, nonatomic) NSString *authCode;

/**
 *  access-token for the authenticated user
 */
@property (copy, nonatomic) NSString *authAccessToken;

/**
 *  Authenticated user's name
 */
@property (copy, nonatomic) NSString *authUsername;


#pragma mark- App's Common Methods
- (NSString *)convertToJSONString:(id)response;

- (CGRect)getHeightOfText:(NSString*)text inFrame:(CGRect)textFrame withFont:(UIFont*)textFont;

@end

