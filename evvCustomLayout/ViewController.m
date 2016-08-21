//
//  ViewController.m
//  evvCustomLayout
//
//  Created by artist on 8/21/16.
//  Copyright © 2016 EddieKwon. All rights reserved.
//


/*
    
    autolayouts 를 사용하지 않는 경우에 view 들을 정렬하는 함수들 구현.
 
 */

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIView *iconBoxView;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _counterLabel.text = @"999888987666";
    
    [self centerAlignedY:_containView]; // 모든 항목을 우선 아래위로 가운데정렬함.
    
    NSArray *seedViews = @[_counterLabel ,_iconBoxView ,_secondLabel ];
    NSArray *paddings = @[@172 ,@20, @10 ];
    [self rightAlignedX:_containView seedViews:seedViews paddings:paddings];
}

/***
 
 note:  맨 우측의 view 부터 순서대로 하나씩 우측 정렬을 함.
 param: 기준이 되는 부모View
 param: 정렬할 View 들
 param: 정렬할 View 에 대한 각각의 우측 padding.
 
 */

- (void)rightAlignedX:(UIView*)momView seedViews:(NSArray*)seedViews paddings:(NSArray*)paddings{
    
     for (UIView* aView in momView.subviews) { //sizeToFit applies if UILabes.
        if ([aView isMemberOfClass:[UILabel class]]) {
            [(UILabel*)aView sizeToFit];
            NSLog(@"aView %@ name:%@", NSStringFromCGRect(  aView.frame) , [(UILabel*)aView text] );
        }
         
         aView.backgroundColor = Random_Color(); //FOR DEBUG
    }

    CGFloat farRightPointX = momView.frame.size.width;

    for (int i = 0; i< seedViews.count ; i++) {

        UIView* aView = (UIView*)seedViews[i];
 
        CGFloat aPadWidth = [paddings[i] floatValue];
        CGRect frm = aView.frame;
        CGFloat newOrigX = farRightPointX - ( aView.frame.size.width  + aPadWidth  );
        frm.origin.x = newOrigX;
        aView.frame = frm;

        farRightPointX = farRightPointX - ( [(UIView*)seedViews[i] frame].size.width + [ paddings[i] floatValue] );
        
    }
 
}
/**
 자식뷰가 하나 만 있는경우만 해당.
 상하를 기준으로 가운데 정렬함.
 */
- (void)centerAlignedY:(UIView*)momView {
    
    for (UIView* aView in momView.subviews) {

        CGRect newFrame = aView.frame;

        CGFloat newY = (momView.bounds.size.height - aView.bounds.size.height )/2.0f;
        
        newFrame = CGRectMake(aView.frame.origin.x, newY, aView.bounds.size.width, aView.bounds.size.height);
        
        aView.frame = newFrame;

    }
}


@end

UIColor *Random_Color()
{
    return [UIColor colorWithRed:Random01()
                         green:Random01()
                          blue:Random01()
                         alpha:1.0f];
}

CGFloat Random01() //0~1 사이 부동소수점
{
    return ((CGFloat) arc4random() / (CGFloat) UINT_MAX);
}

