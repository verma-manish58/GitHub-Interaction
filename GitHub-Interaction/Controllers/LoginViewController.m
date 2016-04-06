//
//  ViewController.m
//  GitHub-Interaction
//
//  Created by Manish Verma on 31/03/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import "LoginViewController.h"
#import "RepositoriesViewController.h"

@interface LoginViewController ()
{
    __weak IBOutlet UITextField *txtfUserName;
    __weak IBOutlet UITextField *txtfUserPassword;
}



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loggedIn) name:@"LoginSuccess" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

#pragma mark- IBAction Methods
- (IBAction)btnLoginTapped:(id)sender {
    
    [self login];
}

#pragma mark-
- (void)login
{
    if ([self validateText])
    {
        //https://api.github.com/users/verma-manish58/repos
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/login/oauth/authorize?scope=nil&client_id=%@",@"c17103c22bd6d519cfbc"]];
        if ([[UIApplication sharedApplication] canOpenURL:url])
            [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)loggedIn
{
    [self getAccessToken];
}

- (void)goToRepositories
{
    RepositoriesViewController *repoVC = [STORYBOARD instantiateViewControllerWithIdentifier:[[RepositoriesViewController class] description]];
    [self.navigationController pushViewController:repoVC animated:YES];
}

- (void)getAccessToken
{
    
    /**
     *
     * Second Approach
     */
    
    [DejalBezelActivityView activityViewForView:self.view];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"c17103c22bd6d519cfbc",@"client_id",
                          @"f2f3e47d85343997c70d4bd1839f1cc0d2fb1eaf",@"client_secret",
                          APPDELEGATE.authCode,@"code", nil];

    [[ServerCommunicator sharedClientWithURL:@"https://github.com/login/oauth/access_token" andResponseType:RESPONSE_TYPE_JSON] POST:@"" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [DejalBezelActivityView removeView];
        
//        NSLog(@"Response====== %@", responseObject);
        
        APPDELEGATE.authAccessToken = [responseObject objectForKey:@"access_token"];
        
        [self getAuthenticatedUser];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [DejalBezelActivityView removeView];
        NSLog(@"Error=== %@", error);
    }];
}

- (void)getAuthenticatedUser
{
    [DejalBezelActivityView activityViewForView:self.view];
    /**
     *  APPROACH- 1
     */
    //https://api.github.com/users/whatever?client_id=xxxx&client_secret=yyyy
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/user?access_token=%@", APPDELEGATE.authAccessToken]]];
    [request setHTTPMethod:@"GET"];
    NSLog(@"request.URL=======%@", request.URL);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        [DejalBezelActivityView removeView];
        NSLog(@"Response Code====== %@", response);
        if (data && ((NSHTTPURLResponse*)response).statusCode == 200) {
            
            id jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
//            NSLog(@"jsonDict========= %@", jsonDict);
            
            APPDELEGATE.engine = [[UAGithubEngine alloc] initWithUsername:[((NSDictionary*)jsonDict) objectForKey:@"login"] password:txtfUserPassword.text withReachability:YES];
            
            
            APPDELEGATE.authUsername = [((NSDictionary*)jsonDict) objectForKey:@"login"];
            [DejalBezelActivityView removeView];
            
            [self goToRepositories];
            
        }
    }];
}

#pragma mark- Validation
- (BOOL)validateText
{
    BOOL isValid =  NO;
    
    NSString *errorMsg;
    
    if (txtfUserName.text.length ==0) {
        errorMsg = @"Please provide username";
    }else if (txtfUserPassword.text.length == 0){
        errorMsg = @"Please provide password";
    }else{
        isValid = YES;
    }
    
    if (!isValid) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:errorMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    return isValid;
}





@end
