//
//  ViewController.m
//  Mac_NSButton
//
//  Created by pengwenjie on 16/9/5.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

#define BUTTONHEIGHT    40
#define BUTTONWIDTH     180
#define BUTTONMARGIN    10

@interface ViewController ()
{
    __weak IBOutlet NSView *backView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 改变NSButton
    NSButton *butn = [[NSButton alloc] initWithFrame:NSMakeRect(100, 0, 80, 40)];
    [butn setTitle:@"变色"];
    butn.bordered = NO;
    [self.view addSubview:butn];
    [self setButtonTitleColor:[NSColor redColor] withButton:butn];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)setButtonTitleColor:(NSColor *)color withButton:(NSButton *)button
{
    NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[button attributedTitle]];
    NSRange titleRange = NSMakeRange(0, [colorTitle length]);
    [colorTitle addAttribute:NSForegroundColorAttributeName value:color range:titleRange];
    [button setAttributedTitle:colorTitle];
}

- (IBAction)NSButtonType:(id)sender {
    
    while (backView.subviews.count) {
        
        NSView* child = backView.subviews.lastObject;
        
        [child removeFromSuperview];
        
    }
    
    [self addButtonType];
}

- (IBAction)NSBezelStyleDown:(id)sender {
    
    while (backView.subviews.count) {
        
        NSView* child = backView.subviews.lastObject;
        
        [child removeFromSuperview];
        
    }
    
    [self addButtonBezelStyle];
}

//typedef NS_ENUM(NSUInteger, NSButtonType) {
//    NSMomentaryLightButton		= 0,	// was NSMomentaryPushButton
//    NSPushOnPushOffButton		= 1,
//    NSToggleButton			= 2,
//    NSSwitchButton			= 3,
//    NSRadioButton			= 4,
//    NSMomentaryChangeButton		= 5,
//    NSOnOffButton			= 6,
//    NSMomentaryPushInButton		= 7,	// was NSMomentaryLight
//    NSAcceleratorButton NS_ENUM_AVAILABLE_MAC(10_10_3)			= 8,
//    NSMultiLevelAcceleratorButton NS_ENUM_AVAILABLE_MAC(10_10_3)	= 9,
//    
//    /* These constants were accidentally reversed so that NSMomentaryPushButton lit and
//     NSMomentaryLight pushed. These names are now deprecated */
//    NSMomentaryPushButton NS_ENUM_DEPRECATED_MAC(10_0, 10_9)    = 0, // NSMomentaryLightButton should be used instead
//    NSMomentaryLight NS_ENUM_DEPRECATED_MAC(10_0, 10_9)         = 7 // NSMomentaryPushInButton should be used instead
//};
//
- (void)addButtonType
{
    NSButton *btn1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn1 setButtonType:NSMomentaryLightButton];
    btn1.title = @"NSMomentaryLightButton";
    [backView addSubview:btn1];
    
    NSButton *btn2 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn2 setButtonType:NSPushOnPushOffButton];
    btn2.title = @"NSPushOnPushOffButton";
    [backView addSubview:btn2];
    
    NSButton *btn3 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*2, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn3 setButtonType:NSToggleButton];
    btn3.title = @"NSToggleButton";
    [backView addSubview:btn3];
    
    NSButton *btn4 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*3, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn4 setButtonType:NSSwitchButton];
    btn4.title = @"NSSwitchButton";
    [backView addSubview:btn4];
    
    NSButton *btn5 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 50, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn5 setButtonType:NSRadioButton];
    btn5.title = @"NSRadioButton";
    [backView addSubview:btn5];
    
    NSButton *btn6 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), BUTTONHEIGHT+BUTTONMARGIN, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn6 setButtonType:NSMomentaryChangeButton];
    btn6.title = @"NSMomentaryChangeButton";
    [backView addSubview:btn6];
    
    NSButton *btn7 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*2, BUTTONHEIGHT+BUTTONMARGIN, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn7 setButtonType:NSOnOffButton];
    btn7.title = @"NSOnOffButton";
    [backView addSubview:btn7];
    
    NSButton *btn8 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*3, BUTTONHEIGHT+BUTTONMARGIN, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn8 setButtonType:NSMomentaryPushInButton];
    btn8.title = @"NSMomentaryPushInButton";
    [backView addSubview:btn8];
    
    NSButton *btn9 = [[NSButton alloc] initWithFrame:NSMakeRect(0, (BUTTONHEIGHT+BUTTONMARGIN)*2, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn9 setButtonType:NSAcceleratorButton];
    btn9.title = @"NSAcceleratorButton";
    [backView addSubview:btn9];
    
    NSButton *btn10 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), (BUTTONHEIGHT+BUTTONMARGIN)*2, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn10 setButtonType:NSMultiLevelAcceleratorButton];
    btn10.title = @"NSMultiLevelAcceleratorButton";
    [backView addSubview:btn10];

}

//typedef NS_ENUM(NSUInteger, NSBezelStyle) {
//    NSRoundedBezelStyle          = 1,
//    NSRegularSquareBezelStyle    = 2,
//    NSThickSquareBezelStyle      = 3,
//    NSThickerSquareBezelStyle    = 4,
//    NSDisclosureBezelStyle       = 5,
//    NSShadowlessSquareBezelStyle = 6,
//    NSCircularBezelStyle         = 7,
//    NSTexturedSquareBezelStyle   = 8,
//    NSHelpButtonBezelStyle       = 9,
//    NSSmallSquareBezelStyle       = 10,
//    NSTexturedRoundedBezelStyle   = 11,
//    NSRoundRectBezelStyle         = 12,
//    NSRecessedBezelStyle          = 13,
//    NSRoundedDisclosureBezelStyle = 14,
//    // The inline bezel style contains a solid round-rect border background. It can be used to create an "unread" indicator in an outline view, or another inline button in a tableview, such as a stop progress button in a download panel. Use text for an unread indicator, and a template image for other buttons.
//    NSInlineBezelStyle NS_ENUM_AVAILABLE_MAC(10_7) = 15,
//
//    NSSmallIconButtonBezelStyle NS_ENUM_DEPRECATED_MAC(10_0, 10_0) = 2 // This bezel style is obsolete and should not be used.
//};
- (void)addButtonBezelStyle
{
    NSButton *btn1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn1 setBezelStyle:NSRoundedBezelStyle];
    btn1.title = @"NSRoundedBezelStyle";
    [backView addSubview:btn1];
    
    NSButton *btn2 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn2 setBezelStyle:NSRegularSquareBezelStyle];
    btn2.title = @"NSRegularSquareBezelStyle";
    [backView addSubview:btn2];
    
    NSButton *btn3 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*2, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn3 setBezelStyle:NSThickSquareBezelStyle];
    btn3.title = @"NSThickSquareBezelStyle";
    [backView addSubview:btn3];
    
    NSButton *btn4 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*3, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn4 setBezelStyle:NSThickerSquareBezelStyle];
    btn4.title = @"NSThickerSquareBezelStyle";
    [backView addSubview:btn4];
    
    NSButton *btn5 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 50, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn5 setBezelStyle:NSDisclosureBezelStyle];
    btn5.title = @"NSDisclosureBezelStyle";
    [backView addSubview:btn5];
    
    NSButton *btn6 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), BUTTONHEIGHT+BUTTONMARGIN, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn6 setBezelStyle:NSShadowlessSquareBezelStyle];
    btn6.title = @"NSShadowlessSquareBezelStyle";
    [backView addSubview:btn6];
    
    NSButton *btn7 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*2, BUTTONHEIGHT+BUTTONMARGIN, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn7 setBezelStyle:NSCircularBezelStyle];
    btn7.title = @"NSCircularBezelStyle";
    [backView addSubview:btn7];
    
    NSButton *btn8 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*3, BUTTONHEIGHT+BUTTONMARGIN, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn8 setBezelStyle:NSTexturedSquareBezelStyle];
    btn8.title = @"NSTexturedSquareBezelStyle";
    [backView addSubview:btn8];
    
    NSButton *btn9 = [[NSButton alloc] initWithFrame:NSMakeRect(0, (BUTTONHEIGHT+BUTTONMARGIN)*2, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn9 setBezelStyle:NSHelpButtonBezelStyle];
    btn9.title = @"NSHelpButtonBezelStyle";
    [backView addSubview:btn9];
    
    NSButton *btn10 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), (BUTTONHEIGHT+BUTTONMARGIN)*2, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn10 setBezelStyle:NSSmallSquareBezelStyle];
    btn10.title = @"NSSmallSquareBezelStyle";
    [backView addSubview:btn10];
    
    NSButton *btn11 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*2, (BUTTONHEIGHT+BUTTONMARGIN)*2, BUTTONWIDTH, BUTTONHEIGHT)];
    btn11.title = @"NSTexturedRoundedBezelStyle";
    [btn11 setBezelStyle:NSTexturedRoundedBezelStyle];
    [backView addSubview:btn11];
    
    NSButton *btn12 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2)*3, (BUTTONHEIGHT+BUTTONMARGIN)*2, BUTTONWIDTH, BUTTONHEIGHT)];
    btn12.title = @"NSRoundRectBezelStyle";
    [btn12 setBezelStyle:NSRoundRectBezelStyle];
    [backView addSubview:btn12];
    
    NSButton *btn13 = [[NSButton alloc] initWithFrame:NSMakeRect(0, (BUTTONHEIGHT+BUTTONMARGIN)*3, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn13 setBezelStyle:NSRecessedBezelStyle];
    btn13.title = @"NSRecessedBezelStyle";
    [backView addSubview:btn13];
    
    NSButton *btn14 = [[NSButton alloc] initWithFrame:NSMakeRect((BUTTONWIDTH+BUTTONMARGIN*2), (BUTTONHEIGHT+BUTTONMARGIN)*3, BUTTONWIDTH, BUTTONHEIGHT)];
    [btn14 setBezelStyle:NSRoundedDisclosureBezelStyle];
    btn11.title = @"NSRoundedDisclosureBezelStyle";
    [backView addSubview:btn14];
}

@end
