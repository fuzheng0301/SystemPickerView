//
//  ViewController.m
//  SystemPickerViewDemo
//
//  Created by 聚财通 on 16/6/21.
//  Copyright © 2016年 付正. All rights reserved.
//

#import "ViewController.h"
#import "FZHPickerView.h"

@interface ViewController ()<FZHPickerViewDelegate>
{
    FZHPickerView *fzpickerView;
    UIButton *showBtn;
    UIButton *removeBtn;
}
@property (nonatomic, strong) UILabel *proTimeLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.proTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 500, 280, 30)];
    self.proTimeLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.proTimeLabel];
    
    // 选择框
    fzpickerView = [[FZHPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    // 显示选中框
    fzpickerView.fzdelegate = self;
    fzpickerView.proTitleList = @[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    
    showBtn = [self buttonWithTitle:@"show" frame:CGRectMake(20, 30, 100, 30) action:@selector(didClickShowBtn) AddView:self.view];
    removeBtn = [self buttonWithTitle:@"remove" frame:CGRectMake(150, 30, 100, 30) action:@selector(didClickRemoveBtn) AddView:self.view];
    
}

-(void)didClickShowBtn
{
    [fzpickerView show:self.view];
}

-(void)didClickRemoveBtn
{
    [fzpickerView remove];
}

#pragma mark --- 代理方法
-(void)didSelectedPickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component RowText:(NSString *)text
{
    self.proTimeLabel.text = [NSString stringWithFormat:@"您选择了第%ld列的第%ld行，内容是%@",(long)component,(long)row,text];
}

#pragma mark --- 创建button公共方法
/**使用示例:[self buttonWithTitle:@"点 击" frame:CGRectMake((self.view.frame.size.width - 150)/2, (self.view.frame.size.height - 40)/3, 150, 40) action:@selector(didClickButton) AddView:self.view];*/
-(UIButton *)buttonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action AddView:(id)view
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchDown];
    [view addSubview:button];
    return button;
}

@end
