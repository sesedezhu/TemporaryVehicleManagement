//
//  LNInfoBuilding.h
//  Camper
//
//  Created by liu on 16/9/17.
//  Copyright © 2016年 ning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNInfoBuildingBaseModule : NSObject
@property (nonatomic ,strong) NSString *title;
@property (nonatomic ,assign) BOOL rightArrow;
@end

@interface LNInfoBuildingSimpleInfoModuel : LNInfoBuildingBaseModule
@property (nonatomic ,strong) NSString *content;
+(LNInfoBuildingSimpleInfoModuel *)initWith:(NSString *)title Content:(NSString *)content Arrow:(BOOL)arrow;
@end

@interface LNInfoBuildingHeadModule : LNInfoBuildingBaseModule
@property (nonatomic ,strong) NSString *head;
@end

@interface LNInfoBuildingEXit : NSObject

@end

@interface LNInfoBuilding : UIViewController
/**
 * 子类需要覆盖此方法
 */
-(NSMutableArray *)LNInfoDataArray;

-(void)LNInfoBuildingHeadAction:(UIGestureRecognizer *)headGes;

-(void)LNInfoBuildingSelectRow:(UITableView *)tableview Indexpath:(NSIndexPath *)indexPath Module:(LNInfoBuildingBaseModule *)module;

-(void)LNReloadUIRow:(NSInteger)row Section:(NSInteger)section;

-(void)LNInfoBuildingReload;

-(void)exitAction:(UIButton *)btn;
@end
