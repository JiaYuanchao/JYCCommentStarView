//
//  JYCCommentStarView.h
//  Pods
//
//  Created by 贾远潮 on 2017/5/12.
//
//

#import <UIKit/UIKit.h>

@interface JYCCommentStarView : UIView

@property (nonatomic, assign, readonly) CGFloat currentStarValue;

@property (nonatomic, assign) BOOL canClick;

@property (nonatomic, copy) void (^changeStarValueBlock)(CGFloat currentStarValue);

- (__kindof JYCCommentStarView *)initWithFrame:(CGRect)frame
                                     starValue:(CGFloat)starValue
                                    starMargin:(CGFloat)starMargin;

- (void)resetStarValue:(CGFloat)starValue;

@end
