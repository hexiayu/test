//
//  CallViewController.m
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import "CallViewController.h"

#import "CallStream.h"

@interface CallViewController ()

@end

@implementation CallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
CallStream *callStream;
- (void)viewDidLoad
{
    [super viewDidLoad];
	callStream = [[CallStream alloc] init];
    [callStream setBitrateType:[self bitrateType]];
    [callStream setCodecType:[self codecType]];
    [callStream setResolution:[self resolution]];
    
    [callStream setLocalPort:[self localPort]];
    [callStream setOtherPort:[self otherPort]];
    [callStream setIp:[self ip]];
    [callStream setImageView:[self imageView]];
    [callStream setLocalImageView:[self localImageView]];
    [callStream startCall];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [_imageView release];
    [_localImageView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageView:nil];
    [self setLocalImageView:nil];
    [super viewDidUnload];
}
- (IBAction)changeCamera:(id)sender {
    [callStream changeCamera];
}

- (IBAction)shutdown:(id)sender {
    [callStream endCall];
    [self dismissModalViewControllerAnimated:YES];
}
@end
