//
//  AddCommentViewController.m
//  GitHub-Interaction
//
//  Created by Manish Verma on 01/04/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import "AddCommentViewController.h"

@interface AddCommentViewController ()
{
    
    __weak IBOutlet UITextView *txtvComment;
}

@end

@implementation AddCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *commentButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Comment"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(comment:)];
    self.navigationItem.rightBarButtonItem = commentButton;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [txtvComment becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [txtvComment resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)comment:(id)sender
{
    /**
     *  Third Approach
     */
//    [self addCommentForIssue:self.issueNumber inRepository:APPDELEGATE.selectedRepo.name];

    
    /**
     *  First Approach
     */
    [self addComment:self.issueNumber inRepository:APPDELEGATE.selectedRepo.name];
}


- (void)addCommentForIssue:(NSUInteger)issuesNumber inRepository:(NSString*)repository
{
    /**
     *  Third Approach
     */
    [DejalBezelActivityView activityViewForView:self.view];
    [APPDELEGATE.engine addComment:txtvComment.text toIssue:issuesNumber forRepository:[NSString stringWithFormat:@"%@/%@", APPDELEGATE.engine.username,repository] success:^(id response) {
        
        [DejalBezelActivityView removeView];
        NSLog(@"Add comment for Issue======= %@", response);
        
        [txtvComment resignFirstResponder];
        [txtvComment setText:@""];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Comment Added" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    } failure:^(NSError *error) {
        [DejalBezelActivityView removeView];
        NSLog(@"Add comment for Issue Error======= %@", error);
    }];
}

- (void)addComment:(NSUInteger)issuesNumber inRepository:(NSString*)repository
{
    [DejalBezelActivityView activityViewForView:self.view];
    
    //POST /repos/:owner/:repo/issues/:number/comments
    //[NSString stringWithFormat:@"repos/%@/issues/%ld/comments", repositoryPath, issueNumber]
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/repos/%@/%@/issues/%ld/comments", APPDELEGATE.authUsername, APPDELEGATE.selectedRepo.name, (unsigned long)issuesNumber]]];
    
    NSLog(@"request.URL=======%@", request.URL);
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObject:txtvComment.text forKey:@"body"];

    NSString *jsonRequest = [APPDELEGATE convertToJSONString:jsonDict];
    NSData *requestData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *authenticationData = [[NSString stringWithFormat:@"%@:%@", APPDELEGATE.engine.username, APPDELEGATE.engine.password] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authenticationValue = [authenticationData base64EncodedStringWithOptions:0];

    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"Basic %@", authenticationValue] forHTTPHeaderField:@"Authorization"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        [DejalBezelActivityView removeView];
        
        if (data && ((NSHTTPURLResponse*)response).statusCode >= 200 && ((NSHTTPURLResponse*)response).statusCode < 300) {
            
            
            NSLog(@"Add comment for Issue======= %@", response);
            
            [txtvComment resignFirstResponder];
            [txtvComment setText:@""];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Comment Added" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
           
            [DejalBezelActivityView removeView];
        }
    }];
}


@end
