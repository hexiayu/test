//
//  SelectionViewController.m
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import "SelectionViewController.h"

@interface SelectionViewController ()

@end

@implementation SelectionViewController
@synthesize callCell;
@synthesize liveCell;
@synthesize videoCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==0) {
        return callCell;
    }
    else if ([indexPath row]==1){
        return liveCell;
    }
    else{
        return videoCell;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)dealloc {
    [callCell release];
    [liveCell release];
    [videoCell release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setCallCell:nil];
    [self setLiveCell:nil];
    [self setVideoCell:nil];
    [super viewDidUnload];
}
@end
