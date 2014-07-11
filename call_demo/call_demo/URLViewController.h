//
//  URLViewController.h
//  call_demo
//
//  Created by ludong on 13-1-26.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLViewController : UITableViewController
@property (retain, nonatomic) IBOutlet UITextField *urlTextField;
@property (retain, nonatomic) IBOutlet UITableViewCell *urlCell;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *doneItem;
- (IBAction)doneAction:(id)sender;

@end
