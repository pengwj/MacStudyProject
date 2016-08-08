//
//  AtViewController.m
//  test@
//
//  Created by pengwenjie on 16/8/1.
//  Copyright © 2016年 彭文杰. All rights reserved.
//

#import "AtViewController.h"

@interface AtViewController ()

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
    _atTable.refusesFirstResponder = YES;
}

- (void)refreshAtTableViewArray:(NSArray *)array
{
    _atArray = [NSMutableArray arrayWithArray:array];
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

- (void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"characters_mouseDown:%@",[theEvent characters]);

}

@end
