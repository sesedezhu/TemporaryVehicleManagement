//
//  SelectListView.h
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectListView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , assign) CGFloat itemWidth;
@property (nonatomic , assign) CGFloat itemHeight;
@property (nonatomic , strong) UITableView *tbView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) NSMutableArray *KDataArray;

@property (nonatomic , strong) UITextField *tfView;

+ (SelectListView *)shareInstance;
- (void)updataUIWith:(UIButton *)btn;
- (void)updataUIWithBtn:(UIButton *)btn withDataArray:(NSArray *)array;

@end
