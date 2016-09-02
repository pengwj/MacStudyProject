//
//  WorkCircleCell.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//


#import "WorkCircleCell.h"
#import "AutolayoutImageView.h"
#import "WCFileShowView.h"
#import "WCPictureShowWindowController.h"
#import <Masonry/Masonry.h>
#import "YWModel.h"

NSInteger const WorkCircleCell_Margin = 10;
NSInteger const WorkCircleCell_HeadWidth = 60;
NSInteger const WorkCircleCell_PhotoViewWidth = 300;
NSInteger const WorkCircleCell_TextFont = 14;

@implementation WorkCircleCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    // Drawing code here.
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self createBaseViews];
        [self addCellViewConstraints];
    }
    return self;
}

// 实例化控件
- (void)createBaseViews{
#pragma mark -- 1
    //头像
    self.headImageView = [NSImageView new];
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = 3.f;
    self.headImageView.image = [NSImage imageNamed:@"1.jpg"];
    [self addSubview:self.headImageView];
    
    //姓名
    self.nameLabel = [NSTextField new];
    self.nameLabel.font = [NSFont systemFontOfSize:15];
    self.nameLabel.stringValue = @"姓名";
    self.nameLabel.bordered = NO;
    self.nameLabel.editable = NO;
    [self addSubview:self.nameLabel];
    
    //时间
    self.timeLabel = [NSTextField new];
    self.timeLabel.font = [NSFont systemFontOfSize:13];
    self.timeLabel.textColor = [NSColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    self.timeLabel.stringValue = @"今天 15:18";
    self.timeLabel.bordered = NO;
    self.nameLabel.editable = NO;
    [self addSubview:self.timeLabel];
    
    //删除
    self.deletButton = [NSButton new];
    [self.deletButton setBezelStyle:NSRoundedBezelStyle];
    [self.deletButton setTitle:@"删除"];
    [self.deletButton setTarget:self];
    [self.deletButton setAction:@selector(deletButtonDown:)];
    [self addSubview:self.deletButton];
    
    //转发
    self.forwardingText = [NSTextField new];
    self.forwardingText.font = [NSFont systemFontOfSize:WorkCircleCell_TextFont];
    self.forwardingText.bordered = NO;
    self.forwardingText.editable = NO;
    [self addSubview:self.forwardingText];
    
    //灰色的线
    self.lineView = [NSTextField new];
    self.lineView.backgroundColor = [NSColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    self.lineView.bordered = NO;
    self.lineView.editable = NO;
    [self addSubview:self.lineView];

    //原文
    self.originalText = [NSTextField new];
    self.originalText.font = [NSFont systemFontOfSize:WorkCircleCell_TextFont];
    self.originalText.bordered = NO;
    self.originalText.editable = NO;
    [self addSubview:self.originalText];
    
#pragma mark -- 2
    //九宫格
    self.autoLayoutImageView = [AutolayoutImageView new];
    [self addSubview:self.autoLayoutImageView];
    
    self.autoLayoutImageView.backgroundColor = [NSColor whiteColor];
    CGFloat itemWidth = (WorkCircleCell_PhotoViewWidth - 4 * 10) / 3;
    self.autoLayoutImageView.itemSize = CGSizeMake(itemWidth, itemWidth);
    self.autoLayoutImageView.lineSpace = 10;
    self.autoLayoutImageView.colSpace = 10;
    self.autoLayoutImageView.numberOfLine =3;
    self.autoLayoutImageView.showAddButton = NO;
    
    __weak  typeof(self) weakSelf = self;
    self.autoLayoutImageView.addBlock = ^(){ //点击添加按钮
        
    };
    
    self.autoLayoutImageView.imageTapBlock = ^(NSArray *images , NSUInteger index)//点击了图片
    {
        [[WCPictureShowWindowController sharedInstancePictures:images index:index] showWindow:weakSelf];
        
    };
    
#pragma mark -- 3
    //文件
    self.fileShowView = [WCFileShowView new];
    [self addSubview:self.fileShowView];
    
    //转发按钮
    self.forwardingButton = [NSButton new];
    [self.forwardingButton setBezelStyle:NSRoundedBezelStyle];
    [self.forwardingButton setTitle:@"转发"];
    [self.forwardingButton setTarget:self];
    [self.forwardingButton setAction:@selector(forwardingButtonDown:)];
    [self addSubview:self.forwardingButton];
    
    //点赞按钮
    self.praiseButton = [NSButton new];
    [self.praiseButton setBezelStyle:NSRoundedBezelStyle];
    [self.praiseButton setTitle:@"赞"];
    [self.praiseButton setTarget:self];
    [self.praiseButton setAction:@selector(praiseButtonDown:)];
    [self addSubview:self.praiseButton];
    
    //评论按钮
    self.commentsButton = [NSButton new];
    [self.commentsButton setBezelStyle:NSRoundedBezelStyle];
    [self.commentsButton setTitle:@"评论"];
    [self.commentsButton setTarget:self];
    [self.commentsButton setAction:@selector(commentsButtonDown:)];
    [self addSubview:self.commentsButton];
    
    self.bottomLine = [NSTextField new];
    self.bottomLine.backgroundColor = [NSColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    self.bottomLine.bordered = NO;
    self.bottomLine.editable = NO;
    [self addSubview:self.bottomLine];

//    //调试背景色
//    self.nameLabel.backgroundColor = [NSColor yellowColor];
//    self.timeLabel.backgroundColor = [NSColor blueColor];
//    self.forwardingText.backgroundColor = [NSColor grayColor];
//    self.originalText.backgroundColor = [NSColor redColor];
//    self.autoLayoutImageView.backgroundColor = [NSColor blackColor];
}

// 添加约束条件
- (void)addCellViewConstraints
{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).offset(WorkCircleCell_Margin);
        make.top.mas_equalTo(self.mas_top).offset(WorkCircleCell_Margin);
        make.size.mas_equalTo(NSMakeSize(WorkCircleCell_HeadWidth, WorkCircleCell_HeadWidth));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImageView.mas_right).offset(WorkCircleCell_Margin/2);
        make.top.mas_equalTo(self.headImageView.mas_top).offset(WorkCircleCell_Margin/2);
        make.right.mas_equalTo(self.mas_right).offset(-WorkCircleCell_Margin*3);
        make.height.mas_equalTo(20);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.bottom.mas_equalTo(self.headImageView.mas_bottom);
        make.width.mas_equalTo(100);
    }];
    
    [self.deletButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.timeLabel.mas_right).offset(WorkCircleCell_Margin);
        make.top.mas_equalTo(self.timeLabel.mas_top);
        make.size.mas_equalTo(NSMakeSize(45, 30));
    }];
    
    [self.forwardingText mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImageView.mas_left);
        make.top.mas_equalTo(self.headImageView.mas_bottom).offset(WorkCircleCell_Margin);
        make.right.mas_equalTo(self.mas_right).offset(-WorkCircleCell_Margin*3);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.forwardingText.mas_bottom).offset(WorkCircleCell_Margin);
        make.height.mas_equalTo(1);
    }];
    
    [self.originalText mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(WorkCircleCell_Margin);
        make.left.mas_equalTo(self.forwardingText.mas_left);
        make.right.mas_equalTo(self.forwardingText.mas_right);
    }];
    
    [self.autoLayoutImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).offset(WorkCircleCell_Margin);
        make.top.mas_equalTo(self.originalText.mas_bottom).offset(WorkCircleCell_Margin);
        make.width.mas_equalTo(WorkCircleCell_PhotoViewWidth);
    }];
    
    [self.fileShowView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).offset(WorkCircleCell_Margin);
        make.right.mas_equalTo(self.mas_right).offset(WorkCircleCell_Margin);
        make.top.mas_equalTo(self.autoLayoutImageView.mas_bottom).offset(WorkCircleCell_Margin);
    }];
    
    [self.forwardingButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).offset(WorkCircleCell_Margin);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-WorkCircleCell_Margin);
        make.size.mas_equalTo(NSMakeSize(45, 30));
    }];
    
    [self.praiseButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(self.commentsButton.mas_left).offset(-WorkCircleCell_Margin);
        make.top.mas_equalTo(self.forwardingButton.mas_top);
        make.size.mas_equalTo(NSMakeSize(45, 30));
    }];
    
    [self.commentsButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(self.mas_right).offset(-WorkCircleCell_Margin*3);
        make.top.mas_equalTo(self.forwardingButton.mas_top);
        make.size.mas_equalTo(NSMakeSize(45, 30));
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-WorkCircleCell_Margin/2);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark - 公开方法
- (void)configWithModel:(YWModel *)model
{
    CGFloat forwardingTextHeight = [self getTextHeightWithText:model.forwardText];
    CGFloat originalTextHeight = [self getTextHeightWithText:model.originalText];
    CGFloat photoHeight = [self getPhotoHeightWith:model.imageArray.count];
    CGFloat fileViewHeight = [self getFileShowViewHeightWithCount:model.fileArray.count];
    
    if (model.forwardText.length == 0) {
        
        [self.originalText mas_updateConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.headImageView.mas_bottom).offset(WorkCircleCell_Margin);
        }];
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make){
            make.height.mas_equalTo(0);
        }];

        [self.forwardingText mas_updateConstraints:^(MASConstraintMaker *make){
            make.height.mas_equalTo(0);
        }];
        
    } else {
    
        [self.forwardingText mas_updateConstraints:^(MASConstraintMaker *make){
            make.height.mas_equalTo(forwardingTextHeight);
        }];
    }
    
    [self.originalText mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(originalTextHeight);
    }];
    
    [self.autoLayoutImageView mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(photoHeight);
    }];
    
    [self.fileShowView mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(fileViewHeight);
    }];
    
    self.originalText.stringValue = model.originalText;
    self.forwardingText.stringValue = model.forwardText;
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<model.imageArray.count; i++) {
        [mutArray addObject:[NSImage imageNamed:[NSString stringWithFormat:@"%@.jpg",model.imageArray[i]]]];
    }
    
    [self.autoLayoutImageView setImages:mutArray];
    
    [self.fileShowView setFileView:model.fileArray];
}

- (CGFloat)getCellHeightWithModel:(YWModel *)model
{
    CGFloat cellHeight = WorkCircleCell_HeadWidth+WorkCircleCell_Margin*2;  // 头像的高度加上下的空余
    if (model.forwardText.length != 0) {
        cellHeight += [self getTextHeightWithText:model.forwardText];       // 转发文字高度
        cellHeight += 2*WorkCircleCell_Margin;                              // 灰色线条、上下的空余
    }
    
    cellHeight += [self getTextHeightWithText:model.originalText];          // 原文文字高度
    cellHeight += [self getPhotoHeightWith:model.imageArray.count] + 2*WorkCircleCell_Margin;         // 图片的高度 + 上下的空余
    cellHeight += [self getFileShowViewHeightWithCount:model.fileArray.count];  // 文件的高度
    cellHeight += 30+2*WorkCircleCell_Margin;                               // 下方三个按钮和空余
    
    return cellHeight;
}

- (CGFloat)getTextHeightWithText:(NSString *)text
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WorkCircleCell_PhotoViewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[NSFont systemFontOfSize:WorkCircleCell_TextFont] forKey:NSFontAttributeName] context:Nil];
    return rect.size.height;
}

- (CGFloat)getPhotoHeightWith:(NSInteger)photoCount
{
    return (WorkCircleCell_PhotoViewWidth/3)*(photoCount/3);
}

- (CGFloat)getFileShowViewHeightWithCount:(NSInteger)fileCount
{
    return 30*fileCount;
}

#pragma mark - ButtonDown
- (void)deletButtonDown:(NSButton*)deletBtn
{
    NSLog(@"deletButtonDown");
}

- (void)openFileButtonDown:(NSButton *)openBtn
{
    NSLog(@"openFileButtonDown");
}

- (void)saveFileButtonDown:(NSButton *)saveBtn
{
    NSLog(@"saveFileButtonDown");
}

- (void)forwardingButtonDown:(NSButton *)forwardingBtn
{
    NSLog(@"forwardingButtonDown");
}

- (void)praiseButtonDown:(NSButton *)praiseBtn
{
    NSLog(@"praiseButtonDown");
}

- (void)commentsButtonDown:(NSButton *)commentsBtn
{
    NSLog(@"commentsButtonDown");
}

@end
