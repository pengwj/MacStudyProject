//
//  WorkCircleCell.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//CGFloat const WCCellHeight = 330;
//CGFloat const WCCellWidth  = 330;

@class AutolayoutImageView,WCFileShowView,YWModel;

@interface WorkCircleCell : NSTableCellView

@property (nonatomic, strong) NSImageView *headImageView;               //头像
@property (nonatomic, strong) NSTextField *nameLabel;                   //姓名
@property (nonatomic, strong) NSTextField *timeLabel;                   //时间
@property (nonatomic, strong) NSButton *deletButton;                    //删除按钮
@property (nonatomic, strong) NSTextField *forwardingText;              //转发内容
@property (nonatomic, strong) NSTextField *lineView;                    //线条
@property (nonatomic, strong) NSTextField *originalText;                //原文内容
@property (nonatomic, strong) AutolayoutImageView *autoLayoutImageView; //九宫格图片
@property (nonatomic, strong) WCFileShowView *fileShowView;             //文件
@property (nonatomic, strong) NSButton *forwardingButton;               //转发按钮
@property (nonatomic, strong) NSButton *praiseButton;                   //点赞按钮
@property (nonatomic, strong) NSButton *commentsButton;                 //评论按钮
@property (nonatomic, strong) NSTextField *bottomLine;                  //最下面的线条

- (void)configWithModel:(YWModel *)model;
- (CGFloat)getCellHeightWithModel:(YWModel *)model;

@end
