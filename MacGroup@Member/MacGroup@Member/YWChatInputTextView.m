//
//  YWChatInputTextView.m
//  test@
//
//  Created by pengwenjie on 16/8/1.
//  Copyright © 2016年 彭文杰. All rights reserved.
//

#import "YWChatInputTextView.h"
#import "AtViewController.h"
#import "AtObj.h"
#import <Carbon/Carbon.h>

#define WORD_BOUNDARY_CHARS [[NSCharacterSet alphanumericCharacterSet] invertedSet]

@interface YWChatInputTextView()
{
    BOOL isAtBack;
    
    NSMutableArray *_atObjArray;
    
}

@property (nonatomic, copy) NSString *substring;

@end

@implementation YWChatInputTextView

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    _atObjArray = [NSMutableArray arrayWithCapacity:0];
}

- (NSPopover*)atPopover
{
    if (!_atPopover)
    {
        _atPopover = [[NSPopover alloc] init];
        _atPopover.animates = YES;
        _atPopover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];
        _atPopover.behavior = NSPopoverBehaviorApplicationDefined;
        if (!_atUserListViewController) {
            _atUserListViewController = [[AtViewController alloc] initWithNibName:@"AtViewController" bundle:nil ];
        }
        _atPopover.contentViewController =_atUserListViewController;
        NSArray *lists = @[@"完美",@"呀哈",@"世界1",@"不能和",@"苦涩娃娃",@"哦韩国高端个人的",@"啊哇哇",@"拉下",@"哦东西",@"可打折",@"阿卡",@"噶哈",@"破碎",@"发大概啊都是梵蒂冈",@"部分功能",@"爱发回国",@"哦拼命地燃烧"];
        [_atUserListViewController refreshAtTableViewArray:lists];
    }
    return _atPopover;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    _isAt = YES;
    isAtBack = NO;
}

-(void)keyDown:(NSEvent *)inEvent{
    BOOL shouldComplete = YES;
    NSInteger row = _atUserListViewController.atTable.selectedRow;
    NSString *charactersIgnoringModifiers = [inEvent charactersIgnoringModifiers];
    unsigned short keyCode = [inEvent keyCode];
    
    if ([charactersIgnoringModifiers length]) {
//        unichar		 inChar = [charactersIgnoringModifiers characterAtIndex:0];
        NSUInteger flags = [inEvent modifierFlags];
        
        if (keyCode == kVK_Return || keyCode == kVK_Tab) {
            
            if (self.atPopover.isShown) {
                [self insert:self];
                return; // Skip default behavior
            } else {
                
                //Make shift+enter work the same as option+enter
                if (flags & NSShiftKeyMask) {
                    [super insertLineBreak:self];
                } else {
                    [super keyDown:inEvent];
                }
            
            }
            
        } else if (keyCode == kVK_Escape){
            if (_atPopover.isShown) {
                [_atPopover close];
            }
            return;
        }
        else if (keyCode == kVK_Delete){    // 选中textview时点击删除按钮
            [super deleteBackward:nil];
            
            if ([self.string hasSuffix:@"@"]) {
                shouldComplete = NO;
                [_atPopover close];
            } else {
                [self deleteAt:inEvent];
            }
            
        } else if (keyCode == kVK_LeftArrow){
            
            AtObj *obj = [self isInAtRange:_atObjArray location:self.selectedRange.location-1];
            if (obj) {
                self.selectedRange = NSMakeRange(obj.range.location, 0);
            } else {
                [super keyDown:inEvent];
            }
            
        } else if  (keyCode == kVK_RightArrow){
            [super keyDown:inEvent];
            AtObj *obj = [self isInAtRange:_atObjArray location:self.selectedRange.location];
            if (obj) {
                self.selectedRange = NSMakeRange(obj.range.location+obj.range.length, 0);
            }
        } else if (keyCode == kVK_UpArrow){
            if (_atPopover.isShown) {
                [self.atUserListViewController.atTable selectRowIndexes:[NSIndexSet indexSetWithIndex:row-1] byExtendingSelection:NO];
                [self.atUserListViewController.atTable scrollRowToVisible:self.atUserListViewController.atTable.selectedRow];
                return; // Skip default behavior
            } else{
                [super keyDown:inEvent];
                AtObj *obj = [self isInAtRange:_atObjArray location:self.selectedRange.location];
                if (obj) {
                    self.selectedRange = NSMakeRange(obj.range.location+obj.range.length, 0);
                }
            }
        } else if (keyCode == kVK_DownArrow){
            if (_atPopover.isShown) {
                [self.atUserListViewController.atTable selectRowIndexes:[NSIndexSet indexSetWithIndex:row+1] byExtendingSelection:NO];
                [self.atUserListViewController.atTable scrollRowToVisible:self.atUserListViewController.atTable.selectedRow];
                return; // Skip default behavior
            } else{
                [super keyDown:inEvent];
                AtObj *obj = [self isInAtRange:_atObjArray location:self.selectedRange.location];
                if (obj) {
                    self.selectedRange = NSMakeRange(obj.range.location+obj.range.length, 0);
                }
            }
        }
        else {

            [super keyDown:inEvent];

        }
        
    } else {
        
        [super keyDown:inEvent];
    }
    

        
        if (_isAt &&  [[inEvent characters] isEqualToString:@"@"]) {
            
            if (shouldComplete) {
                
                [self complete:self];
            }
        }
        
        if([[inEvent characters] isEqualToString:@" "]){
            _isAt= YES;
        }else{
            _isAt=NO;
        }
}

- (void)insert:(id)sender {
    if (self.atUserListViewController.atTable.selectedRow >= 0 && self.atUserListViewController.atTable.selectedRow < self.atUserListViewController.atArray.count) {
        
        NSString *string = [self.atUserListViewController.atArray objectAtIndex:self.atUserListViewController.atTable.selectedRow];
//        NSInteger beginningOfWord = self.selectedRange.location - self.substring.length;
//        NSRange range = NSMakeRange(beginningOfWord, self.substring.length);
//        if ([self shouldChangeTextInRange:range replacementString:string]) {
//            [self replaceCharactersInRange:range withString:string];
//            [self didChangeText];
//        }
        
        [self atViewAtUser:string];
    }
    [self.atPopover close];
}

- (void)complete:(id)sender{
    NSInteger startOfWord = self.selectedRange.location;
    for (NSInteger i = startOfWord - 1; i >= 0; i--) {
        if ([WORD_BOUNDARY_CHARS characterIsMember:[self.string characterAtIndex:i]]) {
            break;
        } else {
            startOfWord--;
        }
    }
    
    NSInteger lengthOfWord = 0;
    for (NSInteger i = startOfWord; i < self.string.length; i++) {
        if ([WORD_BOUNDARY_CHARS characterIsMember:[self.string characterAtIndex:i]]) {
            break;
        } else {
            lengthOfWord++;
        }
    }
    
    self.substring = [self.string substringWithRange:NSMakeRange(startOfWord, lengthOfWord)];
    
    NSRange substringRange = NSMakeRange(self.selectedRange.location, 1);
    NSRect rect = [self firstRectForCharacterRange:substringRange actualRange:NULL];
    rect = [self.window convertRectFromScreen:rect];
    rect = [self convertRect:rect fromView:nil];
    NSString *firstChar = @"@";
    NSSize firstCharSize = [firstChar sizeWithAttributes:@{NSFontAttributeName:self.font}];
    rect.size.width = firstCharSize.width;
    
    [self.atPopover showRelativeToRect:rect
                                ofView:self preferredEdge:NSRectEdgeMaxY];  // NSRectEdgeMinX:左 NSRectEdgeMinY:上 NSRectEdgeMaxX:右 NSRectEdgeMaxY:下
    
    
    
}

- (void)insertText:(id)aString replacementRange:(NSRange)replacementRange
{
    // aStringLength为输入框输入时显示的文字，但并不是最终插入输入框的文字
    NSInteger aStringLength = [(NSString *)aString length];
    NSString *oldString = self.string;
    [super insertText:aString replacementRange:replacementRange];
    NSString *newString = self.string;
    NSInteger insertLength = newString.length-(oldString.length-aStringLength);
    [self changeAtArrayLocation:self.selectedRange.location-insertLength length:insertLength isAdd:YES];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [super mouseDown:theEvent];
    AtObj *obj = [self isInAtRange:_atObjArray location:self.selectedRange.location];
    if (obj) {
        self.selectedRange = NSMakeRange(obj.range.location+obj.range.length, 0);
    }
}

#pragma mark - atView
- (void)atViewAtUser:(NSString *)user
{
    if ([[self.string substringToIndex:self.selectedRange.location] hasSuffix:@"@"]) {
        [self replaceCharactersInRange:NSMakeRange(self.selectedRange.location-1, 1) withString:@""];
    }
    [self changeAtArrayLocation:self.selectedRange.location length:1 isAdd:NO];
    
    user = [NSString stringWithFormat:@"@%@%@",user,@" "];
    
    AtObj *at = [[AtObj alloc] init];
    at.user = user;
    at.userIndex = self.selectedRange.location;
    at.range = NSMakeRange(self.selectedRange.location, user.length);
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:user];
    NSDictionary *blueDic = [NSDictionary dictionaryWithObject:[NSColor blueColor] forKey:NSForegroundColorAttributeName];
    [str removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, str.length)];
    [str addAttributes:blueDic range:NSMakeRange(0, str.length-1)];
    [self insertText:str replacementRange:NSMakeRange(self.selectedRange.location, 0)];
    [self.atPopover close];
    
    [self changeAtArrayLocation:at.range.location length:user.length isAdd:YES];
    
    [_atObjArray addObject:at];
    
}

#pragma mark - 判断location是否在at的范围内
- (AtObj *)isInAtRange:(NSArray *)atArray location:(NSInteger)location
{
    for(AtObj *obj in atArray)
    {
        if (NSLocationInRange(location, obj.range)) {
            return obj;
        }
    }
    return nil;
}

- (void)deleteAt:(NSEvent *)inEvent
{
    AtObj *obj = [self isInAtRange:_atObjArray location:self.selectedRange.location];
    if (obj) {
        
        [self changeAtArrayLocation:obj.range.location+obj.range.length length:obj.range.length isAdd:NO];
        
        [self replaceCharactersInRange:NSMakeRange(obj.range.location, obj.range.length-1) withString:@""];
        
        [_atObjArray removeObject:obj];
    }
    else
    {
        [self changeAtArrayLocation:self.selectedRange.location length:1 isAdd:NO];
    }
}

/**
 *  刷新数组中的range数据
 *
 *  @param location 光标所在位置
 *  @param length   插入数据的长度
 *  @param isAdd    是否是添加
 */
- (void)changeAtArrayLocation:(NSUInteger )location length:(NSInteger)length isAdd:(BOOL)isAdd
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:_atObjArray];
    if (isAdd) {
        for (AtObj *temp in _atObjArray) {
            if (temp.range.location>=location) {
                NSInteger index = [_atObjArray indexOfObject:temp];
                temp.range = NSMakeRange(temp.range.location+length, temp.range.length);
                [tempArray replaceObjectAtIndex:index withObject:temp];
            }
        }
    } else {
        for (AtObj *temp in _atObjArray) {
            if (temp.range.location>=location) {
                NSInteger index = [_atObjArray indexOfObject:temp];
                temp.range = NSMakeRange(temp.range.location-length, temp.range.length);
                [tempArray replaceObjectAtIndex:index withObject:temp];
            }
        }
    }
    
    [_atObjArray removeAllObjects];
    [_atObjArray addObjectsFromArray:tempArray];
    
}

- (void)configAtTableArray:(NSArray *)listArray
{
    if (_atUserListViewController) {
        [_atUserListViewController refreshAtTableViewArray:listArray];
    }
}

- (NSArray *)selectArrayWithString:(NSString *)string
{
    NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:0];
    for (AtObj *temp in _atObjArray) {
        [muArray addObject:temp.user];
    }
    return muArray;
}

////获取文字宽度
//-(CGFloat)getRowWidth:(NSString *)text andFont:(NSFont *)font andMaxWidth:(CGFloat)maxMidth andHeight:(CGFloat)height{
//    
//    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxMidth, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:Nil];
//    return rect.size.width;
//}

@end
