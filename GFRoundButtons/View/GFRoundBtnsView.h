//
//  GFRoundBtnsView.h
//  GFRoundButtons
//
//  Created by gofeyLee on 2018/8/29.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFRoundBtnsView : UIView
- (instancetype)initWithCenterButton:(UIButton *)centerBtn aroundButtons:(NSArray<UIButton *> *)buttons frame:(CGRect)frame;
@end
