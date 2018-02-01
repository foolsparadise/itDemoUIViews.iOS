//
//  AlertWith1inputTextFieldView.m
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "AlertWith1inputTextFieldView.h"

@interface AlertWith1inputTextFieldView ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *alertButton;
@property (nonatomic, strong) UITextField *leftTextField;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation AlertWith1inputTextFieldView

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
    
    [self addSubview:self.leftTextField];
    [self.leftTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(69);
        make.left.mas_equalTo(self.left).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(284, 44));
        //make.right.mas_equalTo(self.mas_centerX).mas_offset(-20);
        
    }];
    
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(69);
        make.left.mas_equalTo(self.leftTextField.mas_right).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 44));
        //make.left.mas_equalTo(self.mas_centerX).mas_offset(20);
    }];
    
    
}

- (void)setTitleAlertString:(NSString *)titleAlertString
{
    [self.alertButton setTitle:NSLocalizedStringFromTable(titleAlertString, @"InfoPlist", nil) forState:UIControlStateNormal];
    [self.alertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)setleftShowString:(NSString *)leftShowString
{
    self.leftTextField.text = NSLocalizedStringFromTable(leftShowString, @"InfoPlist", nil);
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
- (UITextField *)leftTextField
{
    if (!_leftTextField) {
        _leftTextField = [UITextField new];
        _leftTextField.frame = CGRectMake(5, 5, SCREEN_WIDTH - 30, 35);
        _leftTextField.backgroundColor = [UIColor whiteColor];
        //_leftTextField.placeholder = @"Please Input Your Nickname";
        _leftTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _leftTextField.delegate = self;
        _leftTextField.keyboardAppearance = UIKeyboardTypeASCIICapable;
        _leftTextField.returnKeyType = UIReturnKeyDone;
        _leftTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _leftTextField.borderStyle = UITextBorderStyleNone;
        _leftTextField.secureTextEntry = NO;
        _leftTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _leftTextField.font = [UIFont systemFontOfSize:14];;
        
        _leftTextField.layer.borderColor = RGBCOLOR(164 ,166 ,170).CGColor;
        _leftTextField.layer.borderWidth = 0.5;
        _leftTextField.layer.cornerRadius = 12;
        
        NSString *resourePath = [[NSBundle mainBundle] resourcePath];
        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[resourePath stringByAppendingPathComponent:@"ico_leftTextField_leftView"]]];
        _leftTextField.leftView = leftView;
        _leftTextField.leftView.frame = CGRectMake(20, 0, leftView.image.size.width, leftView.image.size.height);
        _leftTextField.leftViewMode = UITextFieldViewModeAlways;

        //_leftTextField.tag = 0; //为零，就不响应了
        //[_leftTextField addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
        _leftTextField.leftView = view;
        _leftTextField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _leftTextField;
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.leftTextField resignFirstResponder];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //    NSString *limited_string = @"abcdefghijklmnopqrstuvwxyz"
    //    @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    //    @"0123456789";
    //    NSRange range11 = [limited_string rangeOfString:string];
    //    if(range11.location == NSNotFound && range.length !=1)
    //        return NO;
    //    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.leftTextField resignFirstResponder];
    return YES;
}
- (void)click_Button:(UIButton *)btn
{
    NSInteger tagg = (long)btn.tag;
    //NSLog(@"click_leftTextField %ld", tagg);
    if(tagg>0)
    {
        [self.delegate AlertWith1inputTextFieldViewDelegate:self.tag withInputString:self.leftTextField.text];
    }
}
@end
