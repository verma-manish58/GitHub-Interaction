//
//  RepositoriesViewController.m
//  GitHub-Interaction
//
//  Created by Manish Verma on 01/04/16.
//  Copyright © 2016 Manish Verma. All rights reserved.
//

#import "RepositoriesViewController.h"
#import "IssuesViewController.h"


@interface RepositoriesViewController ()
{
    
    __weak IBOutlet UITableView *tblRepositories;
    
    /**
     *  Data model for storing info about UserRepository
     */
    UserRepository *userRepo;
    
}

@end

@implementation RepositoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *commentButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Logout"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(logout:)];
    self.navigationItem.leftBarButtonItem = commentButton;
}

- (void)logout:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self performSelectorOnMainThread:@selector(getData) withObject:nil waitUntilDone:YES];
}

- (void)getData
{
    [DejalBezelActivityView activityViewForView:APPDELEGATE.window];
    [self getAllRepositoriesForUserForPage:0];
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

#pragma mark- Get all Repos
- (void)getAllRepositoriesForUserForPage:(NSUInteger)pageNumber
{
    /**
     *  APPROACH- 1
     */
    /**
     *  pagination params:   ?page=1&per_page=300
        currently below request fetches 30 Repos by default
     */
    [DejalBezelActivityView activityViewForView:self.view];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/users/%@/repos", APPDELEGATE.authUsername]]];
    [request setHTTPMethod:@"GET"];
    NSLog(@"request.URL=======%@", request.URL);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        [DejalBezelActivityView removeView];
        
        if (data && ((NSHTTPURLResponse*)response).statusCode == 200) {
            
            id jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
//            NSLog(@"jsonDict========= %@", jsonDict);
            
            NSDictionary *dict = [NSDictionary dictionaryWithObject:jsonDict forKey:@"Repository"];
            
            userRepo = [UserRepository modelObjectWithDictionary:dict];
            
            [tblRepositories reloadData];
            [DejalBezelActivityView removeView]; 
        }
    }];
}



#pragma mark- UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return userRepo.repository.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [(NSArray*)[userRepo.repository valueForKey:@"name"] objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark- UITableViewDelegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    APPDELEGATE.selectedRepo = [userRepo.repository objectAtIndex:indexPath.row];
    
    
    IssuesViewController *issuesVC = [STORYBOARD instantiateViewControllerWithIdentifier:[[IssuesViewController class] description]];
    [self.navigationController pushViewController:issuesVC animated:YES];
}
@end
