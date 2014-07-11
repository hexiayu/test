//
//  CallViewController.h
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallViewController : UIViewController

@property (nonatomic, retain) NSString *ip;
@property int otherPort;
@property int localPort;
@property int codecType;
@property int resolution;
@property int bitrateType;

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIImageView *localImageView;
- (IBAction)changeCamera:(id)sender;
- (IBAction)shutdown:(id)sender;
@end
