//
//  JYCCommentStarView.m
//  Pods
//
//  Created by 贾远潮 on 2017/5/12.
//
//

#import "JYCCommentStarView.h"

CGFloat const kStarWidth = 18;

CGFloat const kStarHeight = 17;

NSString *const kStarSpaceImage = @"starSpace";

NSString *const kStarFullImage = @"starFull";


@interface JYCCommentStarView ()

@property (nonatomic, assign) CGFloat starValue;

@property (nonatomic, assign) CGFloat starMargin;

@end

@implementation JYCCommentStarView

- (__kindof JYCCommentStarView *)initWithFrame:(CGRect)frame
                                     starValue:(CGFloat)starValue
                                    starMargin:(CGFloat)starMargin
{
    if (self = [super initWithFrame:frame]) {
        if (starValue <= 5) {
            self.starMargin = starMargin;
            self.starValue = starValue;
        }
    }
    return self;
}

- (void)resetStarValue:(CGFloat)starValue
{
    if (starValue > 5) {
        return;
    }
    self.starValue = starValue;
}

#pragma mark -- privateMethod 

- (void)setStarValue:(CGFloat)starValue
{
    _starValue = starValue;
    if (_currentStarValue == starValue && starValue != 0) {
        return;
    }
    _currentStarValue = starValue;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (NSInteger i = 1; i < 6; i++) {
        if (i <= starValue) {
            [self addStarImageWithFrame:CGRectMake((i - 1) * (kStarWidth + self.starMargin), 0, kStarWidth, kStarHeight) ImageName:kStarFullImage];
        } else if(i - 1 < starValue && i > starValue) {
            [self addStarImageWithFrame:CGRectMake((i - 1) * (kStarWidth + self.starMargin), 0, kStarWidth, kStarHeight) ImageName:kStarFullImage];
        } else {
            [self addStarImageWithFrame:CGRectMake((i - 1) * (kStarWidth + self.starMargin), 0, kStarWidth, kStarHeight) ImageName:kStarSpaceImage];
        }
    }
}

- (void)addStarImageWithFrame:(CGRect)frame ImageName:(NSString *)starImageName
{
    UIImageView *starImageView = [[UIImageView alloc] initWithFrame:frame];
    CGFloat scale = [UIScreen mainScreen].scale;
    NSString *imageName = [NSString stringWithFormat:@"%@@%0.fx.png",starImageName,scale];
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *imagePath = [currentBundle pathForResource:imageName ofType:nil inDirectory:@"JYCCommentStarView.bundle"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    starImageView.image = image;
    [self addSubview:starImageView];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL isIn = [super pointInside:point withEvent:event];
    if (isIn && self.canClick) {
        NSInteger index = point.x / (kStarWidth + self.starMargin);
        [self resetStarValue:index + 1];
        NSLog(@"%@",NSStringFromCGPoint(point));
    }
    return isIn;
}

@end
