//
//  AtViewController.m
//  test@
//
//  Created by pengwenjie on 16/8/1.
//  Copyright © 2016年 彭文杰. All rights reserved.
//

#import "AtViewController.h"

@interface AtViewController ()
{
    NSArray *_atArray;
}
@end

@implementation AtViewController

static AtViewController *SharedInstance;
+ (AtViewController *)shareInsdtance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SharedInstance = [[AtViewController alloc] initWithNibName:@"AtViewController" bundle:nil];
    });
    //[SharedInstance showWindow:self];
    return SharedInstance;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)awakeFromNib
{
    _atArray = @[@"完美",@"呀哈",@"世界1",@"不能和",@"苦涩娃娃",@"哦韩国高端个人的",@"啊哇哇",@"拉下",@"哦东西",@"可打折",@"阿卡",@"噶哈",@"破碎",@"发大概啊都是梵蒂冈",@"部分功能",@"爱发回国",@"哦拼命地燃烧"];
    [_atTable reloadData];
}

#pragma mark - delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return _atArray.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    static NSString *NODE_CELL_ID = @"PersonInfocell";
    NSTableCellView *cell = [tableView makeViewWithIdentifier:NODE_CELL_ID owner:self];
    if (!cell) {
        cell = [[NSTableCellView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        cell.identifier = NODE_CELL_ID;
    }
    
    cell.textField.stringValue = _atArray[row];
    
    return cell;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 20;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    return YES;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSTableView *selectTableView = notification.object;
    NSLog(@"selectedRow:%ld",[selectTableView selectedRow]);
//    NSInteger selectIndex = [_atTable selectedRow];
//    if (selectIndex<0 || selectIndex>_atArray.count) {
//        return;
//    }
//    
//    if ([self.delegate respondsToSelector:@selector(atViewAtUser:)]) {
//        [self.delegate atViewAtUser:_atArray[selectIndex]];
//    }
}

-(void)keyDown:(NSEvent *)inEvent{
    
    NSLog(@"characters_table:%@",[inEvent characters]);
    NSString *charactersIgnoringModifiers = [inEvent charactersIgnoringModifiers];
    NSInteger selectIndex = [_atTable selectedRow];
    
    if ([charactersIgnoringModifiers length]) {
        unichar		 inChar = [charactersIgnoringModifiers characterAtIndex:0];
        
        if (inChar == NSEnterCharacter || inChar == NSCarriageReturnCharacter) {
            
            if (selectIndex<0 || selectIndex>_atArray.count) {
                return;
            }
            
            if ([self.delegate respondsToSelector:@selector(atViewAtUser:)]) {
                [self.delegate atViewAtUser:_atArray[selectIndex]];
            }
            
        } else {
            
            if ([self.delegate respondsToSelector:@selector(atViewKeyDown:)]) {
                [self.delegate atViewKeyDown:inEvent];
            }
        
        }
    } else {
        
        if ([self.delegate respondsToSelector:@selector(atViewKeyDown:)]) {
            [self.delegate atViewKeyDown:inEvent];
        }
        
    }
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"characters_mouseDown:%@",[theEvent characters]);

}

@end
