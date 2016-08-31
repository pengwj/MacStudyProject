//
//  AutolayoutImageView.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "AutolayoutImageView.h"

#define RGB(r,g,b) RGBA(r,g,b,1)

#define RGBA(r,g,b,a) [NSColor \
colorWithRed:r/255.0 \
green:g/255.0 \
blue:b/255.0 alpha:a]



@interface AutolayoutImageView ()

@property (nonatomic, assign) BOOL hadAddImage;
@end
@implementation AutolayoutImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if (self.backgroundColor) {
        NSRect bounds = [self bounds];
        [self.backgroundColor set];
        [NSBezierPath fillRect:bounds];
    } else {
        NSRect bounds = [self bounds];
        [RGB(240,239, 244) set];
        [NSBezierPath fillRect:bounds];
    }
    
    // Drawing code here.
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.limitImages = 9;
        _images = [NSMutableArray array];
        self.showAddButton = YES;
        self.contentEdgeInset = NSEdgeInsetsMake(10, 10, 10, 10);
        self.itemSize = CGSizeMake(10, 10);
        self.lineSpace = 10;
        self.colSpace = 10;
        self.numberOfLine = 5;
        //        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)layout
{
    for (NSView *temp in self.subviews) {
        [temp removeFromSuperview];
    }
    
    for (int i = 0 ; i < _images.count; i++)
    {
        int line = i/_numberOfLine ; // 行
        int col = i%_numberOfLine ; //  列 1 2 3 4 0 / 1 2 3 4 0
        
        //创建imageView
        TapedImageView *imageView = [[TapedImageView alloc]initWithFrame:CGRectMake(_contentEdgeInset.left + col*(_itemSize.width + _colSpace), _contentEdgeInset.top + line*(_lineSpace + _itemSize.height), _itemSize.height, _itemSize.width)];
        imageView.tag = i;
        imageView.imageScaling = NSImageScaleAxesIndependently;
        imageView.image = [_images objectAtIndex:i];
        [self addSubview:imageView];
        
        //让外面传入index
        __weak  typeof(self) weakSelf = self;
        imageView.tapedBlock = ^(NSUInteger index){
            [weakSelf tapedImage:weakSelf.images atIndex:index];
        };
        
//        //最后一个
//        if (i == _images.count - 1) {
//            self.height = imageView.bottom + _contentEdgeInset.bottom;
//            [self setNeedsDisplay];
//            [self layoutSubtreeIfNeeded];
//        }
    }
}

/**
 * 后去所有上传图片（如果后面有加号图片，删除）
 */
- (NSMutableArray *)uploadImages
{
    NSMutableArray *uploadImages = [NSMutableArray arrayWithArray:_images];
    if (self.hadAddImage) {
        [uploadImages  removeLastObject];
    }
    return uploadImages;
}

- (void)setImages:(NSMutableArray *)images
{
    if (_images.count > 0) {
        [_images removeAllObjects];
    }
    if (_images == nil ) {
        _images = [NSMutableArray arrayWithCapacity:_limitImages];
    }
    [_images removeAllObjects];
    
    if (images.count < self.limitImages) {
        //若图片数组未超过限制数量，直接显示,并增加add图片
        _images = images;
        
        if (self.showAddButton) {
            self.hadAddImage = YES;
            [_images addObject:[NSImage imageNamed:@"工作圈-添加图片"]];
        }
    }else if(images.count == _limitImages){
        //若图片数组等于限制数量，直接显示,不显示add图片
        self.hadAddImage = NO;
        _images = images;
    }
    
    if (images.count > _limitImages) {
        self.hadAddImage = NO;
        //若图片数组超过限制数量，截取限制数量显示
        _images = [NSMutableArray arrayWithArray:[images subarrayWithRange:NSMakeRange(0, _limitImages)]];
    }
    [self layout];
}


- (void)deleteImageAtIndex:(NSUInteger)index
{
    if (self.showAddButton) {
        if (_images.count == _limitImages) {
            //没有add 图片 删除后增加
            [_images removeObjectAtIndex:index];
            [_images addObject:[NSImage imageNamed:@"工作圈-添加图片"]];
            self.hadAddImage = YES;
        }else {
            //有add 图片，若删除index不是add图片的index，执行删除图片
            self.hadAddImage = YES;
            if (index != _images.count- 1) {
                [_images removeObjectAtIndex:index];
            }
        }
    }else{
        [_images removeObjectAtIndex:index];
    }
    
    [self layout];
}

- (void)tapedImage:(NSArray *)images atIndex:(NSUInteger)index
{
    if (self.showAddButton) {
        //有add button
        if (index < _images.count - 1) {
            if (self.imageTapBlock) {
                self.imageTapBlock([self uploadImages],index);
            }
        }else{
            if (self.hadAddImage) {
                if (self.addBlock) {
                    self.addBlock();
                }
            }else {
                
                if (self.imageTapBlock) {
                    self.imageTapBlock([self uploadImages],index);
                }
            }
        }
    }
    
    else{
        //没有add button
        if (self.imageTapBlock) {
            self.imageTapBlock([self uploadImages],index);
        }
    }
}

- (BOOL)isFlipped
{
    return YES;
}

@end
