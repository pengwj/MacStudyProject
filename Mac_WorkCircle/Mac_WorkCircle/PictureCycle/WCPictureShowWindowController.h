//
//  WCPictureShowWindowController.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/31.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WCPictureShowWindowController : NSWindowController

+ (WCPictureShowWindowController *)sharedInstancePictures:(NSArray *)array index:(NSUInteger)index;

@end
