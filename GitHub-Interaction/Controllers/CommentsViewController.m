//
//  AddCommentViewController.m
//  GitHub-Interaction
//
//  Created by Manish Verma on 01/04/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import "CommentsViewController.h"
#import "AddCommentViewController.h"

@interface CommentsViewController ()
{
    __weak IBOutlet UITableView *tblComments;
    
    /**
     *  Data model for storing info
     */
    RepoIssuesComments *repoIssuesComments;
    
    /**
     *  selected indexpath of the comment
     */
    NSIndexPath *selectedIndexpath;
}

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *commentButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Delete"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(deleteComments:)];
    self.navigationItem.rightBarButtonItem = commentButton;
}

- (void)deleteComments:(id)sender
{
    [tblComments setEditing:!tblComments.editing];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self getAllCommentsForIssue:self.issueNumber inRepository:APPDELEGATE.selectedRepo.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
   
}


#pragma mark- Get All Comments For Issue
- (void)getAllCommentsForIssue:(NSUInteger)issuesNumber inRepository:(NSString*)repository
{
    [tblComments setEditing:NO];
    /**
     *  Second Approach
     */
    [DejalBezelActivityView activityViewForView:self.view];
    //@"https://api.github.com"
    //GET /repos/:owner/:repo/issues/:number/comments
    
    [[ServerCommunicator sharedClient] GET:[NSString stringWithFormat:@"/repos/%@/%@/issues/%d/comments", APPDELEGATE.engine.username, APPDELEGATE.selectedRepo.name, issuesNumber] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [DejalBezelActivityView removeView];
        
        NSLog(@"Comments for Issue======= %@", responseObject);
        NSDictionary *dict = [NSDictionary dictionaryWithObject:responseObject forKey:@"IssuesComments"];
        
        repoIssuesComments = [RepoIssuesComments modelObjectWithDictionary:dict];
        
        [tblComments reloadData];
    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [DejalBezelActivityView removeView];
        NSLog(@"Comments for Issue Error======= %@", error);
                                       
    }];
}


#pragma mark- IBAction Methods
- (IBAction)btnAddCommentTapped:(id)sender {
    
    AddCommentViewController *addCommentVC = [STORYBOARD instantiateViewControllerWithIdentifier:[[AddCommentViewController class] description]];
    addCommentVC.issueNumber = self.issueNumber;
    [self.navigationController pushViewController:addCommentVC animated:YES];
}


#pragma mark- UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return repoIssuesComments.issuesComments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [(NSArray*)[repoIssuesComments.issuesComments valueForKey:@"body"] objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark- UITableViewDelegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height = [APPDELEGATE getHeightOfText:[(NSArray*)[repoIssuesComments.issuesComments valueForKey:@"body"] objectAtIndex:indexPath.row] inFrame:CGRectMake(0, 0, 280, MAXFLOAT) withFont:[UIFont systemFontOfSize:16.0]].size.height;
    
    return height < 44 ? 44.0 : height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (aTableView.editing == YES && repoIssuesComments.issuesComments.count > 0)
    {
        return UITableViewCellEditingStyleDelete;
        
    }
    
    
    return UITableViewCellEditingStyleNone;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        selectedIndexpath = indexPath;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Are you sure want to delete this comment?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        alert.tag = 2000;
        [alert show];
    }
}

#pragma mark- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1000) {
        [self getAllCommentsForIssue:self.issueNumber inRepository:APPDELEGATE.selectedRepo.name];
    }
    else if (alertView.tag == 2000 && buttonIndex == 1){ //deletion
        
        IssuesComments *ic = [repoIssuesComments.issuesComments objectAtIndex:selectedIndexpath.row];
        [self deleteComment:ic.issuesCommentsIdentifier fromRepository:[NSString stringWithFormat:@"%@/%@",APPDELEGATE.engine.username,APPDELEGATE.selectedRepo.name]];
    }
}

#pragma mark- Delete Comment
- (void)deleteComment:(NSUInteger)commentNumber fromRepository:(NSString*)repository
{
    [DejalBezelActivityView activityViewForView:self.view];
    //DELETE /repos/:owner/:repo/issues/comments/:id
    
    /**
     *  Third Approach
     */
    
    [APPDELEGATE.engine deleteComment:commentNumber forRepository:repository success:^(BOOL isDeleted) {
        [DejalBezelActivityView removeView];
        if (isDeleted) {
            NSLog(@"Comment Deleted");
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Issue Deleted" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            alert.tag = 1000;
            [alert show];
        }

    } failure:^(NSError *error) {
        [DejalBezelActivityView removeView];
        NSLog(@"Error in deleting comment========== %@", error);
    }];
}



@end
