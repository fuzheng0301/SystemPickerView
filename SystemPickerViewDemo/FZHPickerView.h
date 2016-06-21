//
//  FZHPickerView.h
//  ceshi
//
//  Created by 聚财通 on 16/4/7.
//  Copyright © 2016年 付正. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FZHPickerViewDelegate

-(void)didSelectedPickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component RowText:(NSString *)text;

@end

@interface FZHPickerView : UIPickerView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, weak) id fzdelegate;

@property (nonatomic, strong) NSArray *proTitleList;

-(void)remove;
-(void)show:(UIView *)view;

@end

/*
 *使用方法:
 *1.导入本文件到工程;
 *2.导入头文件FZHPickerView.h;
 *3.服从代理FZHPickerViewDelegate;
 *4.示例代码:
 *
 // 选择框
 fzpickerView = [[FZHPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
 // 显示选中框
 fzpickerView.fzdelegate = self;
 fzpickerView.proTitleList = @[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
 *
 #pragma mark --- 代理方法
 -(void)didSelectedPickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component RowText:(NSString *)text
 {
 self.proTimeLabel.text = [NSString stringWithFormat:@"您选择了第%ld列的第%ld行，内容是%@",(long)component,(long)row,text];
 }
 *
 */
