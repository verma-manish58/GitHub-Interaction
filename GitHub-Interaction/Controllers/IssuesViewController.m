//
//  IssuesViewController.m
//  GitHub-Interaction
//
//  Created by Manish Verma on 01/04/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import "IssuesViewController.h"

#import "CommentsViewController.h"

@interface IssuesViewController ()
{
    
    __weak IBOutlet UISegmentedControl *sgmtCtrl;
    __weak IBOutlet UITableView *tblIssues;
    
    /**
     *  Data models for storing data returned by api
     */
    RepoOpenIssues *repoOpenIssues;
    RepoClosedIssues *repoClosedIssues;
    
    /**
     *  index path of the selected issue
     */
    NSIndexPath *selectedIndexpath;
}

@end

@implementation IssuesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *commentButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Create"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(manageIssues:)];
    self.navigationItem.rightBarButtonItem = commentButton;
    
}

- (void)manageIssues:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please provide a title for the issue" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Create", nil];
    [alert setTag:3000];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    sgmtCtrl.selectedSegmentIndex = 0;
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark- IBAction Methods
- (IBAction)segmentChanged:(id)sender {
    
    [self getData];
}

#pragma mark- Get Data
- (void)getData
{
    [DejalBezelActivityView activityViewForView:self.view];
    
    if (sgmtCtrl.selectedSegmentIndex == 0) {
        [self getAllOpenIssuesForRepository:APPDELEGATE.selectedRepo.name];
    }else{
        [self getAllClosedIssuesForRepository:APPDELEGATE.selectedRepo.name];
    }
}

#pragma mark- Get All Open/Closed Issues For Repo
- (void)getAllOpenIssuesForRepository:(NSString*)repository
{
    /**
     *
     * Second Approach
     */

    //@"https://api.github.com"
    //GET /repos/:owner/:repo/issues
    [[ServerCommunicator sharedClient] GET:[NSString stringWithFormat:@"/repos/%@/%@/issues", APPDELEGATE.engine.username, APPDELEGATE.selectedRepo.name] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Open issues====== %@", responseObject);
        NSDictionary *dict = [NSDictionary dictionaryWithObject:responseObject forKey:@"OpenIssues"];
        
        
        repoOpenIssues = [RepoOpenIssues modelObjectWithDictionary:dict];
        
        [tblIssues reloadData];
        
        [DejalBezelActivityView removeView];    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [DejalBezelActivityView removeView];
        NSLog(@"Open issues error====== %@", error);
        
    }];
    
}


- (void)getAllClosedIssuesForRepository:(NSString*)repository
{
    //@"https://api.github.com"
    //GET /repos/:owner/:repo/issues
    
    /**
     *
     * Second Approach
     */

    [[ServerCommunicator sharedClient] GET:[NSString stringWithFormat:@"/repos/%@/%@/issues?state=closed", APPDELEGATE.engine.username, APPDELEGATE.selectedRepo.name] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"closed Issues======= %@", responseObject);
        NSDictionary *dict = [NSDictionary dictionaryWithObject:responseObject forKey:@"ClosedIssues"];
        
        //        NSLog(@"JSON======= %@", [APPDELEGATE convertToJSONString:dict]);
        
        repoClosedIssues = [RepoClosedIssues modelObjectWithDictionary:dict];
        
        [tblIssues reloadData];
        
        [DejalBezelActivityView removeView];
    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"closed Issues Error ======= %@", error);
        [DejalBezelActivityView removeView];
        
                                   }];
}

#pragma mark- Create New Issue
- (void)createIssueWithTitle:(NSString*)issueTitle inRepository:(NSString*)repository
{
    /**
     *
     * Third Approach
     */

    [DejalBezelActivityView activityViewForView:self.view];
    [APPDELEGATE.engine addIssueForRepository:repository withDictionary:[NSDictionary dictionaryWithObjectsAndKeys:issueTitle,@"title", nil] success:^(id response) {
        NSLog(@"Create issue response===== %@", response);
        [DejalBezelActivityView removeView];
        
        /**
         *  since newly creaed issue will be opened, therefore we set segment control to show open issues
         */
        sgmtCtrl.selectedSegmentIndex = 0;
        [self getData];
        
    } failure:^(NSError *error) {
        NSLog(@"Create issue response error===== %@", error);
        [DejalBezelActivityView removeView];
    }];
}

#pragma mark- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 3000 && buttonIndex ==1)
    {
        UITextField *textField = [alertView textFieldAtIndex:0];
        if (textField.text.length > 0)
        {
            //create issue
            [self createIssueWithTitle:textField.text inRepository:[NSString stringWithFormat:@"%@/%@", APPDELEGATE.engine.username,APPDELEGATE.selectedRepo.name]];
        }
    }
}


#pragma mark- UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sgmtCtrl.selectedSegmentIndex == 0)
        return repoOpenIssues.openIssues.count;

    
    return repoClosedIssues.closedIssues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (sgmtCtrl.selectedSegmentIndex == 0)
        cell.textLabel.text = [(NSArray*)[repoOpenIssues.openIssues valueForKey:@"title"] objectAtIndex:indexPath.row];
    else
        cell.textLabel.text = [(NSArray*)[repoClosedIssues.closedIssues valueForKey:@"title"] objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark- UITableViewDelegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndexpath = indexPath;
    
    CommentsViewController *issuesVC = [STORYBOARD instantiateViewControllerWithIdentifier:[[CommentsViewController class] description]];
    
    if (sgmtCtrl.selectedSegmentIndex == 0) {
         issuesVC.issueNumber  = ((OpenIssues*)[repoOpenIssues.openIssues objectAtIndex:indexPath.row]).number;
    }else{
         issuesVC.issueNumber  = ((ClosedIssues*)[repoClosedIssues.closedIssues objectAtIndex:indexPath.row]).number;
    }
    
    [self.navigationController pushViewController:issuesVC animated:YES];
}


@end
