//
//  MessageHeadView.m
//  VehicleManagement
//
//  Created by 谭晓强 on 2018/7/26.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "MessageHeadView.h"

@implementation MessageHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.leftBtn.layer.cornerRadius = CONVER_VALUE(20);
        _leftBtn.layer.masksToBounds = YES;
        _leftBtn.backgroundColor = [UIColor redColor];
        
        self.cityText.placeholder = @"城市";
        _cityText.font = [UIFont systemFontOfSize:CONVER_VALUE(10)];
        self.seachText.placeholder = @"搜索";
        
        self.rightBtn.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:_leftBtn];
        [self addSubview:_cityText];
        [self addSubview:_seachText];
        [self addSubview:_rightBtn];
    
    }
    return self;
}
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CONVER_VALUE(20), CONVER_VALUE(40), CONVER_VALUE(40))];
    }
    return _leftBtn;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(CONVER_VALUE(300), CONVER_VALUE(20), CONVER_VALUE(40), CONVER_VALUE(40))];
    }
    return _rightBtn;
}
-(UITextField*)cityText{
    if (!_cityText) {
        _cityText = [[UITextField alloc]initWithFrame:CGRectMake(CONVER_VALUE(60), CONVER_VALUE(20), CONVER_VALUE(80), CONVER_VALUE(40))];
    }
    return _cityText;
}
-(UITextField*)seachText{
    if (!_seachText) {
        _seachText = [[UITextField alloc]initWithFrame:CGRectMake(CONVER_VALUE(150), CONVER_VALUE(20), CONVER_VALUE(150), CONVER_VALUE(40))];
    }
    return _seachText;
}

@end
