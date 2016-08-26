//
//  HMEmotionAttachment.m
//  黑马微博
//
//  Created by apple on 14-7-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMEmotionAttachment.h"
#import "HMEmotion.h"

@implementation HMEmotionAttachment

- (void)setEmotion:(HMEmotion *)emotion
{
    _emotion = emotion;
    
    //拼接的图片,原表情图片太大了，显示不出(已经修改为最新的表情)
    self.directory = [NSString stringWithFormat:@"%@/%@", emotion.directory,  emotion.gif];
   //self.image = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", emotion.directory, emotion.png]];
    //self.image = [NSImage imageNamed:[NSString stringWithFormat:@"%@/%@", emotion.directory, emotion.png]];
  //  NSLog(@"self.image = %@",self.image);
}

@end
