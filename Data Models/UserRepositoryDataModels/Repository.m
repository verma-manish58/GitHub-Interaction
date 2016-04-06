//
//  Repository.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Repository.h"
#import "Owner.h"
#import "Permissions.h"


NSString *const kRepositoryKeysUrl = @"keys_url";
NSString *const kRepositoryStatusesUrl = @"statuses_url";
NSString *const kRepositoryIssuesUrl = @"issues_url";
NSString *const kRepositoryDefaultBranch = @"default_branch";
NSString *const kRepositoryIssueEventsUrl = @"issue_events_url";
NSString *const kRepositoryId = @"id";
NSString *const kRepositoryOwner = @"owner";
NSString *const kRepositoryEventsUrl = @"events_url";
NSString *const kRepositorySubscriptionUrl = @"subscription_url";
NSString *const kRepositoryWatchers = @"watchers";
NSString *const kRepositoryGitCommitsUrl = @"git_commits_url";
NSString *const kRepositorySubscribersUrl = @"subscribers_url";
NSString *const kRepositoryCloneUrl = @"clone_url";
NSString *const kRepositoryHasWiki = @"has_wiki";
NSString *const kRepositoryPullsUrl = @"pulls_url";
NSString *const kRepositoryUrl = @"url";
NSString *const kRepositoryFork = @"fork";
NSString *const kRepositoryNotificationsUrl = @"notifications_url";
NSString *const kRepositoryDescription = @"description";
NSString *const kRepositoryCollaboratorsUrl = @"collaborators_url";
NSString *const kRepositoryDeploymentsUrl = @"deployments_url";
NSString *const kRepositoryLanguagesUrl = @"languages_url";
NSString *const kRepositoryHasIssues = @"has_issues";
NSString *const kRepositoryCommentsUrl = @"comments_url";
NSString *const kRepositoryPrivate = @"private";
NSString *const kRepositorySize = @"size";
NSString *const kRepositoryGitTagsUrl = @"git_tags_url";
NSString *const kRepositoryUpdatedAt = @"updated_at";
NSString *const kRepositorySshUrl = @"ssh_url";
NSString *const kRepositoryName = @"name";
NSString *const kRepositoryArchiveUrl = @"archive_url";
NSString *const kRepositoryPermissions = @"permissions";
NSString *const kRepositoryOpenIssuesCount = @"open_issues_count";
NSString *const kRepositoryBlobsUrl = @"blobs_url";
NSString *const kRepositoryContributorsUrl = @"contributors_url";
NSString *const kRepositoryMilestonesUrl = @"milestones_url";
NSString *const kRepositoryContentsUrl = @"contents_url";
NSString *const kRepositoryForksCount = @"forks_count";
NSString *const kRepositoryTreesUrl = @"trees_url";
NSString *const kRepositoryMirrorUrl = @"mirror_url";
NSString *const kRepositoryHasDownloads = @"has_downloads";
NSString *const kRepositoryCreatedAt = @"created_at";
NSString *const kRepositoryForksUrl = @"forks_url";
NSString *const kRepositorySvnUrl = @"svn_url";
NSString *const kRepositoryCommitsUrl = @"commits_url";
NSString *const kRepositoryHomepage = @"homepage";
NSString *const kRepositoryTeamsUrl = @"teams_url";
NSString *const kRepositoryBranchesUrl = @"branches_url";
NSString *const kRepositoryIssueCommentUrl = @"issue_comment_url";
NSString *const kRepositoryMergesUrl = @"merges_url";
NSString *const kRepositoryGitRefsUrl = @"git_refs_url";
NSString *const kRepositoryGitUrl = @"git_url";
NSString *const kRepositoryForks = @"forks";
NSString *const kRepositoryOpenIssues = @"open_issues";
NSString *const kRepositoryHooksUrl = @"hooks_url";
NSString *const kRepositoryHtmlUrl = @"html_url";
NSString *const kRepositoryReleasesUrl = @"releases_url";
NSString *const kRepositoryAssigneesUrl = @"assignees_url";
NSString *const kRepositoryStargazersUrl = @"stargazers_url";
NSString *const kRepositoryStargazersCount = @"stargazers_count";
NSString *const kRepositoryHasPages = @"has_pages";
NSString *const kRepositoryCompareUrl = @"compare_url";
NSString *const kRepositoryTagsUrl = @"tags_url";
NSString *const kRepositoryWatchersCount = @"watchers_count";
NSString *const kRepositoryFullName = @"full_name";
NSString *const kRepositoryLanguage = @"language";
NSString *const kRepositoryPushedAt = @"pushed_at";
NSString *const kRepositoryLabelsUrl = @"labels_url";
NSString *const kRepositoryDownloadsUrl = @"downloads_url";


@interface Repository ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Repository

@synthesize keysUrl = _keysUrl;
@synthesize statusesUrl = _statusesUrl;
@synthesize issuesUrl = _issuesUrl;
@synthesize defaultBranch = _defaultBranch;
@synthesize issueEventsUrl = _issueEventsUrl;
@synthesize repositoryIdentifier = _repositoryIdentifier;
@synthesize owner = _owner;
@synthesize eventsUrl = _eventsUrl;
@synthesize subscriptionUrl = _subscriptionUrl;
@synthesize watchers = _watchers;
@synthesize gitCommitsUrl = _gitCommitsUrl;
@synthesize subscribersUrl = _subscribersUrl;
@synthesize cloneUrl = _cloneUrl;
@synthesize hasWiki = _hasWiki;
@synthesize pullsUrl = _pullsUrl;
@synthesize url = _url;
@synthesize fork = _fork;
@synthesize notificationsUrl = _notificationsUrl;
@synthesize repositoryDescription = _repositoryDescription;
@synthesize collaboratorsUrl = _collaboratorsUrl;
@synthesize deploymentsUrl = _deploymentsUrl;
@synthesize languagesUrl = _languagesUrl;
@synthesize hasIssues = _hasIssues;
@synthesize commentsUrl = _commentsUrl;
@synthesize privateProperty = _privateProperty;
@synthesize size = _size;
@synthesize gitTagsUrl = _gitTagsUrl;
@synthesize updatedAt = _updatedAt;
@synthesize sshUrl = _sshUrl;
@synthesize name = _name;
@synthesize archiveUrl = _archiveUrl;
@synthesize permissions = _permissions;
@synthesize openIssuesCount = _openIssuesCount;
@synthesize blobsUrl = _blobsUrl;
@synthesize contributorsUrl = _contributorsUrl;
@synthesize milestonesUrl = _milestonesUrl;
@synthesize contentsUrl = _contentsUrl;
@synthesize forksCount = _forksCount;
@synthesize treesUrl = _treesUrl;
@synthesize mirrorUrl = _mirrorUrl;
@synthesize hasDownloads = _hasDownloads;
@synthesize createdAt = _createdAt;
@synthesize forksUrl = _forksUrl;
@synthesize svnUrl = _svnUrl;
@synthesize commitsUrl = _commitsUrl;
@synthesize homepage = _homepage;
@synthesize teamsUrl = _teamsUrl;
@synthesize branchesUrl = _branchesUrl;
@synthesize issueCommentUrl = _issueCommentUrl;
@synthesize mergesUrl = _mergesUrl;
@synthesize gitRefsUrl = _gitRefsUrl;
@synthesize gitUrl = _gitUrl;
@synthesize forks = _forks;
@synthesize openIssues = _openIssues;
@synthesize hooksUrl = _hooksUrl;
@synthesize htmlUrl = _htmlUrl;
@synthesize releasesUrl = _releasesUrl;
@synthesize assigneesUrl = _assigneesUrl;
@synthesize stargazersUrl = _stargazersUrl;
@synthesize stargazersCount = _stargazersCount;
@synthesize hasPages = _hasPages;
@synthesize compareUrl = _compareUrl;
@synthesize tagsUrl = _tagsUrl;
@synthesize watchersCount = _watchersCount;
@synthesize fullName = _fullName;
@synthesize language = _language;
@synthesize pushedAt = _pushedAt;
@synthesize labelsUrl = _labelsUrl;
@synthesize downloadsUrl = _downloadsUrl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.keysUrl = [self objectOrNilForKey:kRepositoryKeysUrl fromDictionary:dict];
            self.statusesUrl = [self objectOrNilForKey:kRepositoryStatusesUrl fromDictionary:dict];
            self.issuesUrl = [self objectOrNilForKey:kRepositoryIssuesUrl fromDictionary:dict];
            self.defaultBranch = [self objectOrNilForKey:kRepositoryDefaultBranch fromDictionary:dict];
            self.issueEventsUrl = [self objectOrNilForKey:kRepositoryIssueEventsUrl fromDictionary:dict];
            self.repositoryIdentifier = [[self objectOrNilForKey:kRepositoryId fromDictionary:dict] doubleValue];
            self.owner = [Owner modelObjectWithDictionary:[dict objectForKey:kRepositoryOwner]];
            self.eventsUrl = [self objectOrNilForKey:kRepositoryEventsUrl fromDictionary:dict];
            self.subscriptionUrl = [self objectOrNilForKey:kRepositorySubscriptionUrl fromDictionary:dict];
            self.watchers = [[self objectOrNilForKey:kRepositoryWatchers fromDictionary:dict] doubleValue];
            self.gitCommitsUrl = [self objectOrNilForKey:kRepositoryGitCommitsUrl fromDictionary:dict];
            self.subscribersUrl = [self objectOrNilForKey:kRepositorySubscribersUrl fromDictionary:dict];
            self.cloneUrl = [self objectOrNilForKey:kRepositoryCloneUrl fromDictionary:dict];
            self.hasWiki = [[self objectOrNilForKey:kRepositoryHasWiki fromDictionary:dict] boolValue];
            self.pullsUrl = [self objectOrNilForKey:kRepositoryPullsUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRepositoryUrl fromDictionary:dict];
            self.fork = [[self objectOrNilForKey:kRepositoryFork fromDictionary:dict] boolValue];
            self.notificationsUrl = [self objectOrNilForKey:kRepositoryNotificationsUrl fromDictionary:dict];
            self.repositoryDescription = [self objectOrNilForKey:kRepositoryDescription fromDictionary:dict];
            self.collaboratorsUrl = [self objectOrNilForKey:kRepositoryCollaboratorsUrl fromDictionary:dict];
            self.deploymentsUrl = [self objectOrNilForKey:kRepositoryDeploymentsUrl fromDictionary:dict];
            self.languagesUrl = [self objectOrNilForKey:kRepositoryLanguagesUrl fromDictionary:dict];
            self.hasIssues = [[self objectOrNilForKey:kRepositoryHasIssues fromDictionary:dict] boolValue];
            self.commentsUrl = [self objectOrNilForKey:kRepositoryCommentsUrl fromDictionary:dict];
            self.privateProperty = [[self objectOrNilForKey:kRepositoryPrivate fromDictionary:dict] boolValue];
            self.size = [[self objectOrNilForKey:kRepositorySize fromDictionary:dict] doubleValue];
            self.gitTagsUrl = [self objectOrNilForKey:kRepositoryGitTagsUrl fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kRepositoryUpdatedAt fromDictionary:dict];
            self.sshUrl = [self objectOrNilForKey:kRepositorySshUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRepositoryName fromDictionary:dict];
            self.archiveUrl = [self objectOrNilForKey:kRepositoryArchiveUrl fromDictionary:dict];
            self.permissions = [Permissions modelObjectWithDictionary:[dict objectForKey:kRepositoryPermissions]];
            self.openIssuesCount = [[self objectOrNilForKey:kRepositoryOpenIssuesCount fromDictionary:dict] doubleValue];
            self.blobsUrl = [self objectOrNilForKey:kRepositoryBlobsUrl fromDictionary:dict];
            self.contributorsUrl = [self objectOrNilForKey:kRepositoryContributorsUrl fromDictionary:dict];
            self.milestonesUrl = [self objectOrNilForKey:kRepositoryMilestonesUrl fromDictionary:dict];
            self.contentsUrl = [self objectOrNilForKey:kRepositoryContentsUrl fromDictionary:dict];
            self.forksCount = [[self objectOrNilForKey:kRepositoryForksCount fromDictionary:dict] doubleValue];
            self.treesUrl = [self objectOrNilForKey:kRepositoryTreesUrl fromDictionary:dict];
            self.mirrorUrl = [self objectOrNilForKey:kRepositoryMirrorUrl fromDictionary:dict];
            self.hasDownloads = [[self objectOrNilForKey:kRepositoryHasDownloads fromDictionary:dict] boolValue];
            self.createdAt = [self objectOrNilForKey:kRepositoryCreatedAt fromDictionary:dict];
            self.forksUrl = [self objectOrNilForKey:kRepositoryForksUrl fromDictionary:dict];
            self.svnUrl = [self objectOrNilForKey:kRepositorySvnUrl fromDictionary:dict];
            self.commitsUrl = [self objectOrNilForKey:kRepositoryCommitsUrl fromDictionary:dict];
            self.homepage = [self objectOrNilForKey:kRepositoryHomepage fromDictionary:dict];
            self.teamsUrl = [self objectOrNilForKey:kRepositoryTeamsUrl fromDictionary:dict];
            self.branchesUrl = [self objectOrNilForKey:kRepositoryBranchesUrl fromDictionary:dict];
            self.issueCommentUrl = [self objectOrNilForKey:kRepositoryIssueCommentUrl fromDictionary:dict];
            self.mergesUrl = [self objectOrNilForKey:kRepositoryMergesUrl fromDictionary:dict];
            self.gitRefsUrl = [self objectOrNilForKey:kRepositoryGitRefsUrl fromDictionary:dict];
            self.gitUrl = [self objectOrNilForKey:kRepositoryGitUrl fromDictionary:dict];
            self.forks = [[self objectOrNilForKey:kRepositoryForks fromDictionary:dict] doubleValue];
            self.openIssues = [[self objectOrNilForKey:kRepositoryOpenIssues fromDictionary:dict] doubleValue];
            self.hooksUrl = [self objectOrNilForKey:kRepositoryHooksUrl fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kRepositoryHtmlUrl fromDictionary:dict];
            self.releasesUrl = [self objectOrNilForKey:kRepositoryReleasesUrl fromDictionary:dict];
            self.assigneesUrl = [self objectOrNilForKey:kRepositoryAssigneesUrl fromDictionary:dict];
            self.stargazersUrl = [self objectOrNilForKey:kRepositoryStargazersUrl fromDictionary:dict];
            self.stargazersCount = [[self objectOrNilForKey:kRepositoryStargazersCount fromDictionary:dict] doubleValue];
            self.hasPages = [[self objectOrNilForKey:kRepositoryHasPages fromDictionary:dict] boolValue];
            self.compareUrl = [self objectOrNilForKey:kRepositoryCompareUrl fromDictionary:dict];
            self.tagsUrl = [self objectOrNilForKey:kRepositoryTagsUrl fromDictionary:dict];
            self.watchersCount = [[self objectOrNilForKey:kRepositoryWatchersCount fromDictionary:dict] doubleValue];
            self.fullName = [self objectOrNilForKey:kRepositoryFullName fromDictionary:dict];
            self.language = [self objectOrNilForKey:kRepositoryLanguage fromDictionary:dict];
            self.pushedAt = [self objectOrNilForKey:kRepositoryPushedAt fromDictionary:dict];
            self.labelsUrl = [self objectOrNilForKey:kRepositoryLabelsUrl fromDictionary:dict];
            self.downloadsUrl = [self objectOrNilForKey:kRepositoryDownloadsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.keysUrl forKey:kRepositoryKeysUrl];
    [mutableDict setValue:self.statusesUrl forKey:kRepositoryStatusesUrl];
    [mutableDict setValue:self.issuesUrl forKey:kRepositoryIssuesUrl];
    [mutableDict setValue:self.defaultBranch forKey:kRepositoryDefaultBranch];
    [mutableDict setValue:self.issueEventsUrl forKey:kRepositoryIssueEventsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repositoryIdentifier] forKey:kRepositoryId];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kRepositoryOwner];
    [mutableDict setValue:self.eventsUrl forKey:kRepositoryEventsUrl];
    [mutableDict setValue:self.subscriptionUrl forKey:kRepositorySubscriptionUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.watchers] forKey:kRepositoryWatchers];
    [mutableDict setValue:self.gitCommitsUrl forKey:kRepositoryGitCommitsUrl];
    [mutableDict setValue:self.subscribersUrl forKey:kRepositorySubscribersUrl];
    [mutableDict setValue:self.cloneUrl forKey:kRepositoryCloneUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasWiki] forKey:kRepositoryHasWiki];
    [mutableDict setValue:self.pullsUrl forKey:kRepositoryPullsUrl];
    [mutableDict setValue:self.url forKey:kRepositoryUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.fork] forKey:kRepositoryFork];
    [mutableDict setValue:self.notificationsUrl forKey:kRepositoryNotificationsUrl];
    [mutableDict setValue:self.repositoryDescription forKey:kRepositoryDescription];
    [mutableDict setValue:self.collaboratorsUrl forKey:kRepositoryCollaboratorsUrl];
    [mutableDict setValue:self.deploymentsUrl forKey:kRepositoryDeploymentsUrl];
    [mutableDict setValue:self.languagesUrl forKey:kRepositoryLanguagesUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIssues] forKey:kRepositoryHasIssues];
    [mutableDict setValue:self.commentsUrl forKey:kRepositoryCommentsUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.privateProperty] forKey:kRepositoryPrivate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kRepositorySize];
    [mutableDict setValue:self.gitTagsUrl forKey:kRepositoryGitTagsUrl];
    [mutableDict setValue:self.updatedAt forKey:kRepositoryUpdatedAt];
    [mutableDict setValue:self.sshUrl forKey:kRepositorySshUrl];
    [mutableDict setValue:self.name forKey:kRepositoryName];
    [mutableDict setValue:self.archiveUrl forKey:kRepositoryArchiveUrl];
    [mutableDict setValue:[self.permissions dictionaryRepresentation] forKey:kRepositoryPermissions];
    [mutableDict setValue:[NSNumber numberWithDouble:self.openIssuesCount] forKey:kRepositoryOpenIssuesCount];
    [mutableDict setValue:self.blobsUrl forKey:kRepositoryBlobsUrl];
    [mutableDict setValue:self.contributorsUrl forKey:kRepositoryContributorsUrl];
    [mutableDict setValue:self.milestonesUrl forKey:kRepositoryMilestonesUrl];
    [mutableDict setValue:self.contentsUrl forKey:kRepositoryContentsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.forksCount] forKey:kRepositoryForksCount];
    [mutableDict setValue:self.treesUrl forKey:kRepositoryTreesUrl];
    [mutableDict setValue:self.mirrorUrl forKey:kRepositoryMirrorUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasDownloads] forKey:kRepositoryHasDownloads];
    [mutableDict setValue:self.createdAt forKey:kRepositoryCreatedAt];
    [mutableDict setValue:self.forksUrl forKey:kRepositoryForksUrl];
    [mutableDict setValue:self.svnUrl forKey:kRepositorySvnUrl];
    [mutableDict setValue:self.commitsUrl forKey:kRepositoryCommitsUrl];
    [mutableDict setValue:self.homepage forKey:kRepositoryHomepage];
    [mutableDict setValue:self.teamsUrl forKey:kRepositoryTeamsUrl];
    [mutableDict setValue:self.branchesUrl forKey:kRepositoryBranchesUrl];
    [mutableDict setValue:self.issueCommentUrl forKey:kRepositoryIssueCommentUrl];
    [mutableDict setValue:self.mergesUrl forKey:kRepositoryMergesUrl];
    [mutableDict setValue:self.gitRefsUrl forKey:kRepositoryGitRefsUrl];
    [mutableDict setValue:self.gitUrl forKey:kRepositoryGitUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.forks] forKey:kRepositoryForks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.openIssues] forKey:kRepositoryOpenIssues];
    [mutableDict setValue:self.hooksUrl forKey:kRepositoryHooksUrl];
    [mutableDict setValue:self.htmlUrl forKey:kRepositoryHtmlUrl];
    [mutableDict setValue:self.releasesUrl forKey:kRepositoryReleasesUrl];
    [mutableDict setValue:self.assigneesUrl forKey:kRepositoryAssigneesUrl];
    [mutableDict setValue:self.stargazersUrl forKey:kRepositoryStargazersUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stargazersCount] forKey:kRepositoryStargazersCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasPages] forKey:kRepositoryHasPages];
    [mutableDict setValue:self.compareUrl forKey:kRepositoryCompareUrl];
    [mutableDict setValue:self.tagsUrl forKey:kRepositoryTagsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.watchersCount] forKey:kRepositoryWatchersCount];
    [mutableDict setValue:self.fullName forKey:kRepositoryFullName];
    [mutableDict setValue:self.language forKey:kRepositoryLanguage];
    [mutableDict setValue:self.pushedAt forKey:kRepositoryPushedAt];
    [mutableDict setValue:self.labelsUrl forKey:kRepositoryLabelsUrl];
    [mutableDict setValue:self.downloadsUrl forKey:kRepositoryDownloadsUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.keysUrl = [aDecoder decodeObjectForKey:kRepositoryKeysUrl];
    self.statusesUrl = [aDecoder decodeObjectForKey:kRepositoryStatusesUrl];
    self.issuesUrl = [aDecoder decodeObjectForKey:kRepositoryIssuesUrl];
    self.defaultBranch = [aDecoder decodeObjectForKey:kRepositoryDefaultBranch];
    self.issueEventsUrl = [aDecoder decodeObjectForKey:kRepositoryIssueEventsUrl];
    self.repositoryIdentifier = [aDecoder decodeDoubleForKey:kRepositoryId];
    self.owner = [aDecoder decodeObjectForKey:kRepositoryOwner];
    self.eventsUrl = [aDecoder decodeObjectForKey:kRepositoryEventsUrl];
    self.subscriptionUrl = [aDecoder decodeObjectForKey:kRepositorySubscriptionUrl];
    self.watchers = [aDecoder decodeDoubleForKey:kRepositoryWatchers];
    self.gitCommitsUrl = [aDecoder decodeObjectForKey:kRepositoryGitCommitsUrl];
    self.subscribersUrl = [aDecoder decodeObjectForKey:kRepositorySubscribersUrl];
    self.cloneUrl = [aDecoder decodeObjectForKey:kRepositoryCloneUrl];
    self.hasWiki = [aDecoder decodeBoolForKey:kRepositoryHasWiki];
    self.pullsUrl = [aDecoder decodeObjectForKey:kRepositoryPullsUrl];
    self.url = [aDecoder decodeObjectForKey:kRepositoryUrl];
    self.fork = [aDecoder decodeBoolForKey:kRepositoryFork];
    self.notificationsUrl = [aDecoder decodeObjectForKey:kRepositoryNotificationsUrl];
    self.repositoryDescription = [aDecoder decodeObjectForKey:kRepositoryDescription];
    self.collaboratorsUrl = [aDecoder decodeObjectForKey:kRepositoryCollaboratorsUrl];
    self.deploymentsUrl = [aDecoder decodeObjectForKey:kRepositoryDeploymentsUrl];
    self.languagesUrl = [aDecoder decodeObjectForKey:kRepositoryLanguagesUrl];
    self.hasIssues = [aDecoder decodeBoolForKey:kRepositoryHasIssues];
    self.commentsUrl = [aDecoder decodeObjectForKey:kRepositoryCommentsUrl];
    self.privateProperty = [aDecoder decodeBoolForKey:kRepositoryPrivate];
    self.size = [aDecoder decodeDoubleForKey:kRepositorySize];
    self.gitTagsUrl = [aDecoder decodeObjectForKey:kRepositoryGitTagsUrl];
    self.updatedAt = [aDecoder decodeObjectForKey:kRepositoryUpdatedAt];
    self.sshUrl = [aDecoder decodeObjectForKey:kRepositorySshUrl];
    self.name = [aDecoder decodeObjectForKey:kRepositoryName];
    self.archiveUrl = [aDecoder decodeObjectForKey:kRepositoryArchiveUrl];
    self.permissions = [aDecoder decodeObjectForKey:kRepositoryPermissions];
    self.openIssuesCount = [aDecoder decodeDoubleForKey:kRepositoryOpenIssuesCount];
    self.blobsUrl = [aDecoder decodeObjectForKey:kRepositoryBlobsUrl];
    self.contributorsUrl = [aDecoder decodeObjectForKey:kRepositoryContributorsUrl];
    self.milestonesUrl = [aDecoder decodeObjectForKey:kRepositoryMilestonesUrl];
    self.contentsUrl = [aDecoder decodeObjectForKey:kRepositoryContentsUrl];
    self.forksCount = [aDecoder decodeDoubleForKey:kRepositoryForksCount];
    self.treesUrl = [aDecoder decodeObjectForKey:kRepositoryTreesUrl];
    self.mirrorUrl = [aDecoder decodeObjectForKey:kRepositoryMirrorUrl];
    self.hasDownloads = [aDecoder decodeBoolForKey:kRepositoryHasDownloads];
    self.createdAt = [aDecoder decodeObjectForKey:kRepositoryCreatedAt];
    self.forksUrl = [aDecoder decodeObjectForKey:kRepositoryForksUrl];
    self.svnUrl = [aDecoder decodeObjectForKey:kRepositorySvnUrl];
    self.commitsUrl = [aDecoder decodeObjectForKey:kRepositoryCommitsUrl];
    self.homepage = [aDecoder decodeObjectForKey:kRepositoryHomepage];
    self.teamsUrl = [aDecoder decodeObjectForKey:kRepositoryTeamsUrl];
    self.branchesUrl = [aDecoder decodeObjectForKey:kRepositoryBranchesUrl];
    self.issueCommentUrl = [aDecoder decodeObjectForKey:kRepositoryIssueCommentUrl];
    self.mergesUrl = [aDecoder decodeObjectForKey:kRepositoryMergesUrl];
    self.gitRefsUrl = [aDecoder decodeObjectForKey:kRepositoryGitRefsUrl];
    self.gitUrl = [aDecoder decodeObjectForKey:kRepositoryGitUrl];
    self.forks = [aDecoder decodeDoubleForKey:kRepositoryForks];
    self.openIssues = [aDecoder decodeDoubleForKey:kRepositoryOpenIssues];
    self.hooksUrl = [aDecoder decodeObjectForKey:kRepositoryHooksUrl];
    self.htmlUrl = [aDecoder decodeObjectForKey:kRepositoryHtmlUrl];
    self.releasesUrl = [aDecoder decodeObjectForKey:kRepositoryReleasesUrl];
    self.assigneesUrl = [aDecoder decodeObjectForKey:kRepositoryAssigneesUrl];
    self.stargazersUrl = [aDecoder decodeObjectForKey:kRepositoryStargazersUrl];
    self.stargazersCount = [aDecoder decodeDoubleForKey:kRepositoryStargazersCount];
    self.hasPages = [aDecoder decodeBoolForKey:kRepositoryHasPages];
    self.compareUrl = [aDecoder decodeObjectForKey:kRepositoryCompareUrl];
    self.tagsUrl = [aDecoder decodeObjectForKey:kRepositoryTagsUrl];
    self.watchersCount = [aDecoder decodeDoubleForKey:kRepositoryWatchersCount];
    self.fullName = [aDecoder decodeObjectForKey:kRepositoryFullName];
    self.language = [aDecoder decodeObjectForKey:kRepositoryLanguage];
    self.pushedAt = [aDecoder decodeObjectForKey:kRepositoryPushedAt];
    self.labelsUrl = [aDecoder decodeObjectForKey:kRepositoryLabelsUrl];
    self.downloadsUrl = [aDecoder decodeObjectForKey:kRepositoryDownloadsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_keysUrl forKey:kRepositoryKeysUrl];
    [aCoder encodeObject:_statusesUrl forKey:kRepositoryStatusesUrl];
    [aCoder encodeObject:_issuesUrl forKey:kRepositoryIssuesUrl];
    [aCoder encodeObject:_defaultBranch forKey:kRepositoryDefaultBranch];
    [aCoder encodeObject:_issueEventsUrl forKey:kRepositoryIssueEventsUrl];
    [aCoder encodeDouble:_repositoryIdentifier forKey:kRepositoryId];
    [aCoder encodeObject:_owner forKey:kRepositoryOwner];
    [aCoder encodeObject:_eventsUrl forKey:kRepositoryEventsUrl];
    [aCoder encodeObject:_subscriptionUrl forKey:kRepositorySubscriptionUrl];
    [aCoder encodeDouble:_watchers forKey:kRepositoryWatchers];
    [aCoder encodeObject:_gitCommitsUrl forKey:kRepositoryGitCommitsUrl];
    [aCoder encodeObject:_subscribersUrl forKey:kRepositorySubscribersUrl];
    [aCoder encodeObject:_cloneUrl forKey:kRepositoryCloneUrl];
    [aCoder encodeBool:_hasWiki forKey:kRepositoryHasWiki];
    [aCoder encodeObject:_pullsUrl forKey:kRepositoryPullsUrl];
    [aCoder encodeObject:_url forKey:kRepositoryUrl];
    [aCoder encodeBool:_fork forKey:kRepositoryFork];
    [aCoder encodeObject:_notificationsUrl forKey:kRepositoryNotificationsUrl];
    [aCoder encodeObject:_repositoryDescription forKey:kRepositoryDescription];
    [aCoder encodeObject:_collaboratorsUrl forKey:kRepositoryCollaboratorsUrl];
    [aCoder encodeObject:_deploymentsUrl forKey:kRepositoryDeploymentsUrl];
    [aCoder encodeObject:_languagesUrl forKey:kRepositoryLanguagesUrl];
    [aCoder encodeBool:_hasIssues forKey:kRepositoryHasIssues];
    [aCoder encodeObject:_commentsUrl forKey:kRepositoryCommentsUrl];
    [aCoder encodeBool:_privateProperty forKey:kRepositoryPrivate];
    [aCoder encodeDouble:_size forKey:kRepositorySize];
    [aCoder encodeObject:_gitTagsUrl forKey:kRepositoryGitTagsUrl];
    [aCoder encodeObject:_updatedAt forKey:kRepositoryUpdatedAt];
    [aCoder encodeObject:_sshUrl forKey:kRepositorySshUrl];
    [aCoder encodeObject:_name forKey:kRepositoryName];
    [aCoder encodeObject:_archiveUrl forKey:kRepositoryArchiveUrl];
    [aCoder encodeObject:_permissions forKey:kRepositoryPermissions];
    [aCoder encodeDouble:_openIssuesCount forKey:kRepositoryOpenIssuesCount];
    [aCoder encodeObject:_blobsUrl forKey:kRepositoryBlobsUrl];
    [aCoder encodeObject:_contributorsUrl forKey:kRepositoryContributorsUrl];
    [aCoder encodeObject:_milestonesUrl forKey:kRepositoryMilestonesUrl];
    [aCoder encodeObject:_contentsUrl forKey:kRepositoryContentsUrl];
    [aCoder encodeDouble:_forksCount forKey:kRepositoryForksCount];
    [aCoder encodeObject:_treesUrl forKey:kRepositoryTreesUrl];
    [aCoder encodeObject:_mirrorUrl forKey:kRepositoryMirrorUrl];
    [aCoder encodeBool:_hasDownloads forKey:kRepositoryHasDownloads];
    [aCoder encodeObject:_createdAt forKey:kRepositoryCreatedAt];
    [aCoder encodeObject:_forksUrl forKey:kRepositoryForksUrl];
    [aCoder encodeObject:_svnUrl forKey:kRepositorySvnUrl];
    [aCoder encodeObject:_commitsUrl forKey:kRepositoryCommitsUrl];
    [aCoder encodeObject:_homepage forKey:kRepositoryHomepage];
    [aCoder encodeObject:_teamsUrl forKey:kRepositoryTeamsUrl];
    [aCoder encodeObject:_branchesUrl forKey:kRepositoryBranchesUrl];
    [aCoder encodeObject:_issueCommentUrl forKey:kRepositoryIssueCommentUrl];
    [aCoder encodeObject:_mergesUrl forKey:kRepositoryMergesUrl];
    [aCoder encodeObject:_gitRefsUrl forKey:kRepositoryGitRefsUrl];
    [aCoder encodeObject:_gitUrl forKey:kRepositoryGitUrl];
    [aCoder encodeDouble:_forks forKey:kRepositoryForks];
    [aCoder encodeDouble:_openIssues forKey:kRepositoryOpenIssues];
    [aCoder encodeObject:_hooksUrl forKey:kRepositoryHooksUrl];
    [aCoder encodeObject:_htmlUrl forKey:kRepositoryHtmlUrl];
    [aCoder encodeObject:_releasesUrl forKey:kRepositoryReleasesUrl];
    [aCoder encodeObject:_assigneesUrl forKey:kRepositoryAssigneesUrl];
    [aCoder encodeObject:_stargazersUrl forKey:kRepositoryStargazersUrl];
    [aCoder encodeDouble:_stargazersCount forKey:kRepositoryStargazersCount];
    [aCoder encodeBool:_hasPages forKey:kRepositoryHasPages];
    [aCoder encodeObject:_compareUrl forKey:kRepositoryCompareUrl];
    [aCoder encodeObject:_tagsUrl forKey:kRepositoryTagsUrl];
    [aCoder encodeDouble:_watchersCount forKey:kRepositoryWatchersCount];
    [aCoder encodeObject:_fullName forKey:kRepositoryFullName];
    [aCoder encodeObject:_language forKey:kRepositoryLanguage];
    [aCoder encodeObject:_pushedAt forKey:kRepositoryPushedAt];
    [aCoder encodeObject:_labelsUrl forKey:kRepositoryLabelsUrl];
    [aCoder encodeObject:_downloadsUrl forKey:kRepositoryDownloadsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Repository *copy = [[Repository alloc] init];
    
    if (copy) {

        copy.keysUrl = [self.keysUrl copyWithZone:zone];
        copy.statusesUrl = [self.statusesUrl copyWithZone:zone];
        copy.issuesUrl = [self.issuesUrl copyWithZone:zone];
        copy.defaultBranch = [self.defaultBranch copyWithZone:zone];
        copy.issueEventsUrl = [self.issueEventsUrl copyWithZone:zone];
        copy.repositoryIdentifier = self.repositoryIdentifier;
        copy.owner = [self.owner copyWithZone:zone];
        copy.eventsUrl = [self.eventsUrl copyWithZone:zone];
        copy.subscriptionUrl = [self.subscriptionUrl copyWithZone:zone];
        copy.watchers = self.watchers;
        copy.gitCommitsUrl = [self.gitCommitsUrl copyWithZone:zone];
        copy.subscribersUrl = [self.subscribersUrl copyWithZone:zone];
        copy.cloneUrl = [self.cloneUrl copyWithZone:zone];
        copy.hasWiki = self.hasWiki;
        copy.pullsUrl = [self.pullsUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.fork = self.fork;
        copy.notificationsUrl = [self.notificationsUrl copyWithZone:zone];
        copy.repositoryDescription = [self.repositoryDescription copyWithZone:zone];
        copy.collaboratorsUrl = [self.collaboratorsUrl copyWithZone:zone];
        copy.deploymentsUrl = [self.deploymentsUrl copyWithZone:zone];
        copy.languagesUrl = [self.languagesUrl copyWithZone:zone];
        copy.hasIssues = self.hasIssues;
        copy.commentsUrl = [self.commentsUrl copyWithZone:zone];
        copy.privateProperty = self.privateProperty;
        copy.size = self.size;
        copy.gitTagsUrl = [self.gitTagsUrl copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.sshUrl = [self.sshUrl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.archiveUrl = [self.archiveUrl copyWithZone:zone];
        copy.permissions = [self.permissions copyWithZone:zone];
        copy.openIssuesCount = self.openIssuesCount;
        copy.blobsUrl = [self.blobsUrl copyWithZone:zone];
        copy.contributorsUrl = [self.contributorsUrl copyWithZone:zone];
        copy.milestonesUrl = [self.milestonesUrl copyWithZone:zone];
        copy.contentsUrl = [self.contentsUrl copyWithZone:zone];
        copy.forksCount = self.forksCount;
        copy.treesUrl = [self.treesUrl copyWithZone:zone];
        copy.mirrorUrl = [self.mirrorUrl copyWithZone:zone];
        copy.hasDownloads = self.hasDownloads;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.forksUrl = [self.forksUrl copyWithZone:zone];
        copy.svnUrl = [self.svnUrl copyWithZone:zone];
        copy.commitsUrl = [self.commitsUrl copyWithZone:zone];
        copy.homepage = [self.homepage copyWithZone:zone];
        copy.teamsUrl = [self.teamsUrl copyWithZone:zone];
        copy.branchesUrl = [self.branchesUrl copyWithZone:zone];
        copy.issueCommentUrl = [self.issueCommentUrl copyWithZone:zone];
        copy.mergesUrl = [self.mergesUrl copyWithZone:zone];
        copy.gitRefsUrl = [self.gitRefsUrl copyWithZone:zone];
        copy.gitUrl = [self.gitUrl copyWithZone:zone];
        copy.forks = self.forks;
        copy.openIssues = self.openIssues;
        copy.hooksUrl = [self.hooksUrl copyWithZone:zone];
        copy.htmlUrl = [self.htmlUrl copyWithZone:zone];
        copy.releasesUrl = [self.releasesUrl copyWithZone:zone];
        copy.assigneesUrl = [self.assigneesUrl copyWithZone:zone];
        copy.stargazersUrl = [self.stargazersUrl copyWithZone:zone];
        copy.stargazersCount = self.stargazersCount;
        copy.hasPages = self.hasPages;
        copy.compareUrl = [self.compareUrl copyWithZone:zone];
        copy.tagsUrl = [self.tagsUrl copyWithZone:zone];
        copy.watchersCount = self.watchersCount;
        copy.fullName = [self.fullName copyWithZone:zone];
        copy.language = [self.language copyWithZone:zone];
        copy.pushedAt = [self.pushedAt copyWithZone:zone];
        copy.labelsUrl = [self.labelsUrl copyWithZone:zone];
        copy.downloadsUrl = [self.downloadsUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
