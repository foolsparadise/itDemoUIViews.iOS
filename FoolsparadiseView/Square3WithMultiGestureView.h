//
//  Square3WithMultiGestureView.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Square3WithMultiGestureViewDelegate <NSObject>
@optional
- (void)Square3WithMultiGestureViewDelegate:(NSInteger)ClickedTag withButtonTag:(NSInteger)ButtonTag;
@end

@interface Square3WithMultiGestureView : UIView

@property (nonatomic, strong) NSString *upImageViewString;
@property (nonatomic, strong) NSString *middleLableString;
@property (nonatomic, strong) NSString *downImageViewString;

@property (nonatomic, weak) id <Square3WithMultiGestureViewDelegate> delegate;

@end
