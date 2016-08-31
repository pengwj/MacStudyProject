//
//  AutoGroupCellImageView.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "AutoReminderView.h"

@protocol AutoGroupCellImageViewDelegate <NSObject>

-(void)tapedImageView:(NSImageView *)imageView withImagUrls:(NSMutableArray *)imageUrls;

-(void)longTouchImage:(NSImageView *)imageView withImagUrls:(NSMutableArray *)imageUrls;

@end

@interface AutoGroupCellImageView : AutoReminderView

/*
 *显示的图片Url
 */
@property (nonatomic, strong) NSMutableArray *imageUrls;


@property (nonatomic, weak) id<AutoGroupCellImageViewDelegate> delegate;

/*
 *images 小图 若网络下载的图片失败，用NSNull 的一个实例表示一个空图片
 */
- (NSMutableArray *)uploadImages;

@end
