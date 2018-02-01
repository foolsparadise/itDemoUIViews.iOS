//
//  AlertWith1inputTextFieldView.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertWith1inputTextFieldViewDelegate <NSObject>
@optional
- (void)AlertWith1inputTextFieldViewDelegate:(NSInteger)ClickedTag withInputString:(NSString *)InputString;
@end

@interface AlertWith1inputTextFieldView : UIView

@property (nonatomic, strong) NSString *titleAlertString;
@property (nonatomic, strong) NSString *leftShowString;
@property (nonatomic, strong) NSString *rightButtonString;

@property (nonatomic, weak) id <AlertWith1inputTextFieldViewDelegate> delegate;

@end
