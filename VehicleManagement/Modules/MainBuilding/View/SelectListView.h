//
//  SelectListView.h
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@interface SelectListView : UIView <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,CAAnimationDelegate,UISearchBarDelegate>
#else
@interface SelectListView : UIView <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
#endif

{
    CGRect btnRect;
}
@property (nonatomic , assign) CGFloat itemWidth;
@property (nonatomic , assign) CGFloat itemHeight;
@property (nonatomic , strong) UITableView *tbView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) NSMutableArray *KDataArray;
@property (nonatomic , strong) UISearchBar *searchBarView;


@property (nonatomic ,strong) void (^selectObj)(NSString *string);

+ (SelectListView *)shareInstance;
- (void)updataUIWithBtn:(UIButton *)btn withDataArray:(NSArray *)array;
- (BOOL)viewHiddenWithBtn:(UIButton*)btnl;
@end
