//
//  AtViewController.h
//  test@
//
//  Created by pengwenjie on 16/8/1.
//  Copyright © 2016年 彭文杰. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol atViewDelegate <NSObject>

- (void)atViewKeyDown:(NSEvent *)inEvent;
- (void)atViewAtUser:(NSString *)user;

@end

@interface AtViewController : NSViewController

@property (weak) IBOutlet NSTableView *atTable;
@property (nonatomic, assign) id<atViewDelegate> delegate;

+ (AtViewController *)shareInsdtance;

@end
