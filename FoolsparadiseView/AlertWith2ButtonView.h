//
//  AlertWith2ButtonView.h
//  iOSUIViewKit
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertWith2ButtonViewDelegate <NSObject>
@optional
- (void)AlertWith2ButtonViewDelegate:(NSInteger)ClickedTag withButtonTag:(NSInteger)ButtonTag;
@end

@interface AlertWith2ButtonView : UIView

@property (nonatomic, strong) NSString *titleAlertString;
@property (nonatomic, strong) NSString *leftButtonString;
@property (nonatomic, strong) NSString *rightButtonString;

@property (nonatomic, weak) id <AlertWith2ButtonViewDelegate> delegate;

@end
