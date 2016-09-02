//
//  AutolayoutImageView.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TapedImageView.h"

//点中的图片block
typedef void(^autoLayoutImageBlock)(NSArray *images , NSUInteger index);
//增加图片block
typedef void(^addImageBlock)();

@interface AutolayoutImageView : NSView
{
    NSMutableArray *_images;
}

@property (nonatomic, copy) autoLayoutImageBlock imageTapBlock;
@property (nonatomic, copy) addImageBlock addBlock;

/*
 *显示的图片
 */
@property (nonatomic , strong) NSMutableArray *images;

/**
 *限制显示的图片数目,默认 9
 **/
@property NSUInteger limitImages;
/*
 *图片大小 defalut (10, 10)
 */
@property  CGSize itemSize;

/*
 *四周边距 defalu (10, 10 , 10 ,10)
 */
@property NSEdgeInsets contentEdgeInset;

/*
 *图片行间距 defalut 10
 */
@property CGFloat lineSpace;
/*
 *图片列间距 defalut 10
 */
@property CGFloat colSpace;
/*
 *每行显示的图片数目 defalut 5
 */
@property NSUInteger numberOfLine;

/*
 *是否显示add button 默认YES 显示
 */
@property BOOL showAddButton;

@property (nonatomic, strong) NSColor *backgroundColor;

- (void)layoutPhoto;

- (void)tapedImage:(NSArray *)images atIndex:(NSUInteger)index;

- (NSMutableArray *)uploadImages;

- (void)deleteImageAtIndex:(NSUInteger)index;

@end
