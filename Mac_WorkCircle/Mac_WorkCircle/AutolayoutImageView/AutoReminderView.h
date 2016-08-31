//
//  AutoReminderView.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "AutolayoutImageView.h"

typedef void(^YWClickedAvatarBlock)(NSUInteger avatarTag);

@interface AutoReminderView : AutolayoutImageView

/*
 *add button 默认不显示
 */
@property (nonatomic, copy) YWClickedAvatarBlock clickedAvatarBlock;

@end
