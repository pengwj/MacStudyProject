//
//  HMEmotionAttachment.h
//  黑马微博
//
//  Created by apple on 14-7-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <AppKit/AppKit.h>
@class HMEmotion;
@interface HMEmotionAttachment : NSTextAttachment
@property (nonatomic, strong) HMEmotion *emotion;
@property (nonatomic,copy) NSString *directory;
@end
