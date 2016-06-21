//
//  FZHPickerView.m
//  ceshi
//
//  Created by 聚财通 on 16/4/7.
//  Copyright © 2016年 付正. All rights reserved.
//

#import "FZHPickerView.h"

@implementation FZHPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 选择框
        self.frame = frame;
        // 显示选中框
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [_proTitleList count];
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_proTitleList[component] count];
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_proTitleList[component] objectAtIndex:row];
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return self.frame.size.width/[self.proTitleList count];
}

// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([self.fzdelegate respondsToSelector:@selector(didSelectedPickerView:didSelectRow:inComponent:RowText:)]) {
        [self.fzdelegate didSelectedPickerView:self didSelectRow:row inComponent:component RowText:_proTitleList[component][row]];
    }
}

-(void)remove
{
    [self removeFromSuperview];
}

-(void)show:(UIView *)view
{
    [view addSubview:self];
}

@end
