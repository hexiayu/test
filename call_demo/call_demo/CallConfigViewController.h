//
//  CallConfigViewController.h
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallViewController.h"

@interface CallConfigViewController : UITableViewController<UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *ipTextField;
@property (retain, nonatomic) IBOutlet UITextField *otherPortTextField;
@property (retain, nonatomic) IBOutlet UITextField *localPortTextField;
@property (retain, nonatomic) IBOutlet UIPickerView *selectionPickerView;

@property (retain, nonatomic) IBOutlet UITableViewCell *ipCell;
@property (retain, nonatomic) IBOutlet UITableViewCell *otherCell;
@property (retain, nonatomic) IBOutlet UITableViewCell *localCell;
@property (retain, nonatomic) IBOutlet UITableViewCell *selectionCell;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *doneItem;
- (IBAction)doneAction:(id)sender;
@end
