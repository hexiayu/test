//
//  LiveViewController.h
//  call_demo
//
//  Created by ludong on 13-1-26.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveViewController : UIViewController
@property (retain, nonatomic) NSString *url;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)stopAction:(id)sender;
@end
