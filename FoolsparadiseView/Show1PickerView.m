//
//  Show1PickerView.m
//
//
//  Created by foolsparadise on 19/4/2019.
//  Copyright © 2019 github.com/foolsparadise All rights reserved.
//

#import "Show1PickerView.h"
#define SCREENW     [UIScreen mainScreen].bounds.size.width

@interface Show1PickerView () <UIPickerViewDataSource,UIPickerViewDelegate> {
    UIView *contentView;
}
@property(nonatomic,strong) NSMutableArray *defaultarray;
@property (nonatomic, copy) NSString *defaultobj;
@property (nonatomic, copy) NSString *selectedobj;
@end

@implementation Show1PickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initShow1PickerViewDWithArray:(NSArray *)defaultarray WithDefaultObj:(NSString *)defaultobj
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
    }
    self.defaultarray = [[NSMutableArray alloc] init];
    self.defaultarray = [defaultarray copy];
    self.defaultobj = defaultobj;
    self.selectedobj = defaultobj;
    [self initDataSource];
    [self initAppreaence];
    return self;
}
- (void)initDataSource {
    self.defaultobj = self.defaultobj ? self.defaultobj : self.defaultarray[0];
}
- (void)initAppreaence {
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 300)];
    [self addSubview:contentView];
    //设置背景颜色为黑色，并有0.4的透明度
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    //添加白色view
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:whiteView];
    //添加确定和取消按钮
    for (int i = 0; i < 2; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 60) * i, 0, 60, 40)];
        [button setTitle:i == 0 ? @"取消" : @"确定" forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitleColor:[UIColor colorWithRed:97.0 / 255.0 green:97.0 / 255.0 blue:97.0 / 255.0 alpha:1] forState:UIControlStateNormal];
        } else {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        [whiteView addSubview:button];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10 + i;
    }
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth(self.bounds), 260)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.backgroundColor = [UIColor colorWithRed:240.0/255 green:243.0/255 blue:250.0/255 alpha:1];
    
    /*
     设置pickerView默认第一行 这里也可默认选中其他行 修改selectRow即可
     如果后台传过来的不是整点需要特殊处理
     */
//    NSString *obj = [NSString stringWithFormat:@"%@",self.defaultobj];
//    [pickerView selectRow:[self objIndex:obj] inComponent:0 animated:YES];
    [pickerView selectRow:[self objIndex:self.defaultobj] inComponent:0 animated:YES];
    [contentView addSubview:pickerView];
    
//    //在时间选择器上
//    NSArray * labelArr = @[@"时",@"分"];
//    for (int i = 0; i < 2; i++) {
//        UILabel * label = [[UILabel alloc] init];
//        if (i==0) {
//            label.frame = CGRectMake(SCREENW/2 - 40, 260/2-15, 30, 30);
//        }else{
//            label.frame = CGRectMake(SCREENW/2 + 53, 260/2-15, 30, 30);
//        }
//        label.text = labelArr[i];
//        label.font = [UIFont systemFontOfSize:18];
//        label.textColor = [UIColor blackColor];
//        [pickerView addSubview:label];
//        label.textAlignment = NSTextAlignmentCenter;
//    }
    
}
//获取下标
-(NSInteger)objIndex:(NSString *)obj
{
//    //判断分钟是否大于分钟数组的最后一个元素值，如果大则小时+1分钟归0
//    NSInteger hourAdd = [minute integerValue] > [minArray[minArray.count-1] integerValue] ? 1 : 0;
//
//    NSInteger index = [hourArray indexOfObject:hour] + hourAdd;
//    index = index > hourArray.count-1 ? 0 : index;
//    _selectedHour = hourArray[index];
    NSInteger index = 0;
    for (int cont = 0; cont<self.defaultarray.count; cont++) {
        if([obj isEqualToString:self.defaultarray[cont]]) {
            index = cont;
            break;
        }
    }
    NSLog(@"hourIndex - %ld",(long)index);
    return index;
}
- (void)buttonTapped:(UIButton *)sender {
    if (sender.tag == 10) {
        [self dismiss];
    } else {
//        delegate
        if ([self.delegate respondsToSelector:@selector(Show1PickerViewDelegateDidSelected:withTag:)]) {
            [self.delegate Show1PickerViewDelegateDidSelected:self.selectedobj withTag:self.tag];
        }

        [self dismiss];
    }
}
//#pragma mark - pickerView出现
- (void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.4 animations:^{
        contentView.center = CGPointMake(self.frame.size.width/2, contentView.center.y - contentView.frame.size.height);
    }];
}

//#pragma mark - pickerView消失
- (void)dismiss{
    
    [UIView animateWithDuration:0.4 animations:^{
        contentView.center = CGPointMake(self.frame.size.width/2, contentView.center.y + contentView.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
//#pragma mark - UIPickerViewDataSource UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    //if (component == 0)
    {
        return self.defaultarray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    //if (component == 0)
    {
        return self.defaultarray[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //if (component == 0)
    {
        self.selectedobj = self.defaultarray[row];
        
//        if ([_selectedHour isEqualToString:[hourArray lastObject]])
//        {
//            [pickerView selectRow:0 inComponent:1 animated:YES];
//        }
//        [pickerView reloadComponent:1];
        
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30;
}

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, 30)];
    
    //添加一个label
    UILabel * label = [[UILabel alloc] init];
    
    //if (component == 0)
    {
        label.frame = CGRectMake(0, 0, SCREENW, 30);
    }
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    //label.backgroundColor = [UIColor redColor];
    //if (component == 0)
    {
        label.text = [NSString stringWithFormat:@"%@",self.defaultarray[row]];
    }
    
    [bg addSubview:label];
    
    return bg;
}

@end
