//
//  AutoGroupCellImageView.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#define DefaultSmallPic [NSImage imageNamed:@"加载中图片图标"]

#import "AutoGroupCellImageView.h"

@interface AutoGroupCellImageView ()

@property(nonatomic,strong)NSArray <NSImageView *> *imageViewArray;

@property(nonatomic,strong)NSImage *defaultImage;

@end

@implementation AutoGroupCellImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)setImageUrls:(NSMutableArray *)imageUrls
{
    if (_imageUrls.count > 0) {
        [_imageUrls removeAllObjects];
    }
    if (_imageUrls == nil ) {
        _imageUrls = [NSMutableArray arrayWithCapacity:self.limitImages];
    }
    [_imageUrls removeAllObjects];
    
    if (imageUrls.count > self.limitImages) {
        _imageUrls = [NSMutableArray arrayWithArray:[imageUrls subarrayWithRange:NSMakeRange(0, self.limitImages)]];
    }else{
        _imageUrls = [NSMutableArray arrayWithArray:imageUrls];
    }
    _images = [NSMutableArray arrayWithCapacity:imageUrls.count];
    
    [self layout];
}
- (void)layout
{
    [self hideAllSubviews];
    for (int i = 0 ; i < _imageUrls.count; i++) {
        int line = i/self.numberOfLine ;
        int col = i%self.numberOfLine ;
        NSImageView *imageView = [self.imageViewArray objectAtIndex:i];
        [imageView setFrame:CGRectMake(self.contentEdgeInset.left + col*(self.itemSize.width + self.colSpace), self.contentEdgeInset.top + line*(self.lineSpace + self.itemSize.height), self.itemSize.height, self.itemSize.width)];
        imageView.tag = i;
        
        imageView.imageScaling = NSImageScaleAxesIndependently;
        imageView.image = [NSImage imageNamed:@"加载中图片图标"];
        [self addSubview:imageView];
        
        //        NSString *url = [_imageUrls objectAtIndex:i];
        //        [_images addObject:self.defaultImage]; //默认显示底图
        //        if ([url isKindOfClass:[NSNull class]]) {
        //            [imageView setImage:self.defaultImage];
        //            [self addSubview:imageView];
        //
        //        }else{
        //            //根据URL下载图片
        ////            [imageView setImageWithURL:[NSURL URLWithString:url]
        ////                      placeholderImage:self.defaultImage
        ////                             completed:nil];
        //
        //            //创建imageView
        //            imageView.imageScaling = NSImageScaleAxesIndependently;
        //            imageView.image = [_images objectAtIndex:i];
        //            [self addSubview:imageView];
        //        }
        //
        //        imageView.hidden = NO;
        //
        //        //返回总高度
        //        if (i == _imageUrls.count - 1) {
        //            self.height = imageView.bottom + self.contentEdgeInset.bottom;
        //            //            NSLog(@"返回图片总高度%f",self.height);
        ////            [self setNeedsDisplay];
        ////            [self layoutSubtreeIfNeeded];
        //        }
    }
}
/*
 NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(avatarClicked:)];
 click.numberOfClicksRequired = 1;
 [self addGestureRecognizer:click];
 */

//- (void)taped:(NSGestureRecognizer *)gesture
//{
//    NSImageView *imageView = (NSImageView *)gesture.view;
//    if ([self.delegate respondsToSelector:@selector(tapedImageView:withImagUrls:)]) {
//        [self.delegate tapedImageView:imageView withImagUrls:_imageUrls];
//    }
//    //为整个View的block传值
//    if (self.imageTapBlock) {
//        self.imageTapBlock([self uploadImages],imageView.tag);
//    }
//}
//- (void)longTouched:(NSGestureRecognizer *)gesture
//{
//    if (gesture.state == NSGestureRecognizerStateBegan) {
//        NSImageView *imageView = (NSImageView *)gesture.view;
//        if ([self.delegate respondsToSelector:@selector(longTouchImage:withImagUrls:)]) {
//            [self.delegate longTouchImage:imageView withImagUrls:_imageUrls];
//        }
//    }
//
//}

- (NSMutableArray *)uploadImages
{
    return _images;
}

- (NSArray<NSImageView *> *)imageViewArray{
    
    if (!_imageViewArray) {
        
        NSMutableArray *temp =@[].mutableCopy;
        for (int i = 0 ; i<9; i++) {
            
            NSImageView *imageView = [[NSImageView alloc]init];
//            NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(longTouched:)];
//            click.numberOfClicksRequired = 1;
//            [imageView addGestureRecognizer:click];
            
            //            imageView.contentMode = UIViewContentModeScaleAspectFill;
            
            //            imageView.clipsToBounds = YES;
            [temp addObject:imageView];
            
            [self addSubview:imageView];
        }
        _imageViewArray = temp.copy;
    }
    return _imageViewArray;
}

- (void)hideAllSubviews{
    
    [self.imageViewArray enumerateObjectsUsingBlock:^(NSImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.hidden = YES;
        
    }];
    
}

- (NSImage *)defaultImage{
    
    if (!_defaultImage) {
        
        _defaultImage = DefaultSmallPic;
    }
    return _defaultImage;
}

@end
