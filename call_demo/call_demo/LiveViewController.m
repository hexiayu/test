//
//  LiveViewController.m
//  call_demo
//
//  Created by ludong on 13-1-26.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveStream.h"

@interface LiveViewController ()

@end

@implementation LiveViewController
@synthesize url;
@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
LiveStream *liveStream;
- (void)viewDidLoad
{
    [super viewDidLoad];
	liveStream = [[LiveStream alloc] init];
    [liveStream setUrl:[self url]];
    [liveStream setImageView:[self imageView]];
    [liveStream startLive];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [imageView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}

- (IBAction)stopAction:(id)sender {
    [liveStream stopLive];
    [self dismissModalViewControllerAnimated:YES];
}
@end
