//
//  ViewController.m
//  evvCustomLayout
//
//  Created by artist on 8/21/16.
//  Copyright © 2016 EddieKwon. All rights reserved.
//

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
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self dnaRedraw:_containView lastWidth:_containView.bounds.size.width pad:10.0f];
    
    
    
    _counterLabel.text = @"999888987666";
        [_counterLabel sizeToFit];
    
    CGFloat farRightPointX = _containView.frame.size.width;
    
    NSArray *seedViews = @[_counterLabel , _secondLabel ];
    NSArray *paddings = @[@10 , @10 ];
    
    for (int i = 0; i< seedViews.count ; i++) {
        
        UIView* aView = (UIView*)seedViews[i];
        
        NSLog(@"aView %@ name:%@", NSStringFromCGRect(  aView.frame) , [(UILabel*)aView text] );
        
        CGFloat aPadWidth = [paddings[i] floatValue];
        CGRect frm = aView.frame;
        CGFloat newOrigX = farRightPointX - ( aView.frame.size.width  + aPadWidth  );
        frm.origin.x = newOrigX;
        aView.frame = frm;
        
        farRightPointX = farRightPointX - ( [(UIView*)seedViews[i] frame].size.width + [ paddings[i] floatValue] );
        
    }
}

- (void)rightAligned:(UIView*)farRightView seedViews:(NSArray*)seedViews pads:(NSArray*)pads{
    
    
    
    
}

//- (CGFloat)dnaRedraw:(UIView*)seedView childView:(UIView*)childView pad:(CGFloat)pad{
- (void)dnaRedraw:(UIView*)seedView lastWidth:(CGFloat)lastWidth pad:(CGFloat)pad{

//    
//    CGFloat maxSize = seedView.bounds.size.width;
//
//    
//    
//     _counterLabel.text = @"999888987666";
//    [_counterLabel sizeToFit];
//    
    CGFloat seedWidth = seedView.bounds.size.width;
//    CGRect frm = childView.frame;
//    
//    CGFloat newOrigX = seedWidth - ( childView.frame.size.width  + pad  );
//    
//    frm.origin.x = newOrigX;
//    
//    childView.frame = frm;
//    
//    return childView.frame.origin.x;
////
////    
//
//    
//    _counterLabel.text = @"999888987666";
//    
//    CGRect frame = _counterLabel.frame;
//    [_counterLabel sizeToFit];
//    //frame.size.height = label.frame.size.height;
//    
//    _counterLabel.frame = frame;
//    
//    [_counterLabel sizeToFit];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
