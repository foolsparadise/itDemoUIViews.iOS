//
//  Show1PickerView.h
//
//
//  Created by foolsparadise on 19/4/2019.
//  Copyright © 2019 github.com/foolsparadise All rights reserved.
//
// 代码参考自： https://github.com/ITHanYong/HYTimePicker

// Usage:
/*
 #import "Show1PickerView.h"
 <Show1PickerViewDelegate>
 NSArray *arr = [[NSArray alloc] initWithObjects:@"男",@"女", nil];
 NSString *str = @"男";
 Show1PickerView *picker = [[Show1PickerView alloc] initShow1PickerViewDWithArray:arr WithDefaultObj:str];
 picker.tag=1;
 picker.delegate = self;
 [picker show];
 -(void)Show1PickerViewDelegateDidSelected:(NSString *)SelectedString withTag:(NSInteger)tagg
 {
 NSLog(@"%@ %d", SelectedString, tagg);
 if(tagg == 1) { }
 }
 */

#import <UIKit/UIKit.h>

@protocol Show1PickerViewDelegate<NSObject>
@optional
-(void)Show1PickerViewDelegateDidSelected:(NSString *)SelectedString withTag:(NSInteger)tagg;
@end


@interface Show1PickerView : UIView
@property (nonatomic, weak) id<Show1PickerViewDelegate> delegate;

- (instancetype)initShow1PickerViewDWithArray:(NSArray *)defaultarray WithDefaultObj:(NSString *)defaultobj;
- (void)show;

@end
