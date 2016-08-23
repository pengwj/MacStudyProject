//
//  YWChatInputTextView.h
//  test@
//
//  Created by pengwenjie on 16/8/1.
//  Copyright © 2016年 彭文杰. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AtViewController.h"

@interface YWChatInputTextView : NSTextView<NSTextViewDelegate>

/*
 BOOL isAt;
 NSPopover *_atPopover;
 AtViewController *_atUserListViewController;
 */

@property (nonatomic, strong) NSPopover *atPopover;
@property (nonatomic, strong) AtViewController *atUserListViewController;

- (void)configAtTableArray:(NSArray *)listArray;

@end
