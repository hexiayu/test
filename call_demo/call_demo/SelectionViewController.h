//
//  SelectionViewController.h
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionViewController : UITableViewController
@property (retain, nonatomic) IBOutlet UITableViewCell *callCell;
@property (retain, nonatomic) IBOutlet UITableViewCell *liveCell;
@property (retain, nonatomic) IBOutlet UITableViewCell *videoCell;

@end
