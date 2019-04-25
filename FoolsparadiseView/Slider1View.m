//
//  Slider1View.m
//  
//
//  Created by foolsparadise on 19/3/2019.
//  Copyright © 2019 github.com/foolsparadise All rights reserved.
//

#import "Slider1View.h"

@interface Slider1View ()

@property (nonatomic, strong) UIButton *alertButton;
@property (nonatomic, strong) UISlider *leftUISlider;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation Slider1View

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 0;
    self.layer.borderWidth = 1;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
    self.backgroundColor = RGBCOLOR(240, 242, 246);
    
    [self addSubview:self.alertButton];
    [self.alertButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(35);
        make.left.mas_equalTo(self.left).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(self.width-40, 14.5));
        //make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        
    }];
    
    [self addSubview:self.leftUISlider];
    [self.leftUISlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(69);
        make.left.mas_equalTo(self.left).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(284, 44));
        //make.right.mas_equalTo(self.mas_centerX).mas_offset(-20);
        
    }];
    [self.leftUISlider addTarget:self action:@selector(updateProgress:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(69);
        make.left.mas_equalTo(self.leftUISlider.mas_right).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 44));
        //make.left.mas_equalTo(self.mas_centerX).mas_offset(20);
    }];
    
    
}

- (void)setTitleAlertString:(NSString *)titleAlertString
{
    [self.alertButton setTitle:NSLocalizedStringFromTable(titleAlertString, @"InfoPlist", nil) forState:UIControlStateNormal];
    [self.alertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)setCurrentValue:(NSString *)currentValue
{
    self.leftUISlider.value = currentValue.floatValue;
}
- (void)setMaxValue:(NSString *)maxValue
{
    self.leftUISlider.maximumValue = maxValue.floatValue;
}
- (void)setMinValue:(NSString *)minValue
{
    self.leftUISlider.minimumValue = minValue.floatValue;
}
- (void)setRightButtonString:(NSString *)rightButtonString
{
    [self.rightButton setTitle:NSLocalizedStringFromTable(rightButtonString, @"InfoPlist", nil) forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (UIButton *)alertButton
{
    if (!_alertButton) {
        _alertButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _alertButton.backgroundColor = [UIColor clearColor];
        //[_alertButton setTitle:@"SomeTitle" forState:UIControlStateNormal];
        //_alertButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_alertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //_alertButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        //_alertButton.layer.borderWidth = 1;
        _alertButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _alertButton.layer.borderWidth = 0;
        [_alertButton.layer setMasksToBounds:YES];
        [_alertButton.layer setCornerRadius:0];
        _alertButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _alertButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _alertButton.tag = 0; //为零，就不响应了
        [_alertButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _alertButton;
}
- (UISlider *)leftUISlider
{
    if(!_leftUISlider) {
        _leftUISlider = [[UISlider alloc] initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH - 30, 35)];
        _leftUISlider.value = 50;
        _leftUISlider.maximumValue = 100;
        _leftUISlider.minimumValue = 0;
        _leftUISlider.maximumTrackTintColor = [UIColor grayColor];
        _leftUISlider.minimumTrackTintColor = [UIColor redColor];
    }
    return _leftUISlider;
}

- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor whiteColor];
        //[_rightButton setTitle:@"SomeTitle" forState:UIControlStateNormal];
        //_rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        _rightButton.layer.borderWidth = 1;
        _rightButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _rightButton.layer.borderWidth = 0;
        [_rightButton.layer setMasksToBounds:YES];
        [_rightButton.layer setCornerRadius:12.0];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _rightButton.tag = 1; //为零，就不响应了
        [_rightButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightButton;
}
-(void)updateProgress:(UISlider *)slider
{
    NSLog(@"slider value %f",slider.value);
    NSInteger tagg = (long)slider.tag;
    [self.delegate Slider1ViewValueDelegate:tagg withValueString:[NSString stringWithFormat:@"%f", slider.value]];
}
- (void)click_Button:(UIButton *)btn
{
    NSInteger tagg = (long)btn.tag;
    [self.delegate Slider1ViewOKDelegate:tagg];
}
@end
