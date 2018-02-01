//
//  Round5WithMultiGestureView.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Round5WithMultiGestureViewDelegate <NSObject>
@optional
- (void)Round5WithMultiGestureViewDelegate:(NSInteger)ClickedTag withButtonTag:(NSInteger)ButtonTag;
@end

@interface Round5WithMultiGestureView : UIView

@property (nonatomic, strong) NSString *upImageViewString;
@property (nonatomic, strong) NSString *leftImageViewString;
@property (nonatomic, strong) NSString *middleLableString;
@property (nonatomic, strong) NSString *rightImageViewString;
@property (nonatomic, strong) NSString *downImageViewString;

@property (nonatomic, weak) id <Round5WithMultiGestureViewDelegate> delegate;

@end
