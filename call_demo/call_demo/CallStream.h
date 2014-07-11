//
//  CallStream.h
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface CallStream : NSObject<AVCaptureVideoDataOutputSampleBufferDelegate>

@property int codecType;
@property int resolution;
@property int bitrateType;
@property (nonatomic, retain) NSString *ip;
@property int otherPort;
@property int localPort;

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImageView *localImageView;
@property (nonatomic, retain) UIView *view;

-(void)startCall;
-(void)changeCamera;
-(void)endCall;
@end
