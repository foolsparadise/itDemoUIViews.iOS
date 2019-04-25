//
//  Slider1View.h
//  
//
//  Created by foolsparadise on 19/3/2019.
//  Copyright © 2019 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Slider1ViewDelegate <NSObject>
@optional
- (void)Slider1ViewValueDelegate:(NSInteger)ClickedTag withValueString:(NSString *)valueString;
- (void)Slider1ViewOKDelegate:(NSInteger)ClickedTag;
@end

@interface Slider1View : UIView

@property (nonatomic, strong) NSString *titleAlertString;
@property (nonatomic, strong) NSString *currentValue;
@property (nonatomic, strong) NSString *minValue;
@property (nonatomic, strong) NSString *maxValue;
@property (nonatomic, strong) NSString *rightButtonString;

@property (nonatomic, weak) id <Slider1ViewDelegate> delegate;

@end
