//
//  ViewController.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "AutolayoutImageView.h"
#import "AutoGroupCellImageView.h"
#import "AutoReminderView.h"

@interface ViewController : NSViewController

@property (nonatomic, strong) AutolayoutImageView *autoLayoutImageView;
@property (nonatomic, strong) NSTableView *workTableView;

@end

