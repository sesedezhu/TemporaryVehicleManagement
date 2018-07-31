//
//  CarArrangeCell.h
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/26.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarArrangeCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lookTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lookTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentAndTelephoneTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentAndTelephoneTitleStrLabel;
@property (weak, nonatomic) IBOutlet UILabel *departurePlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *buildingLabel;


@property (nonatomic , strong) NSString *lookTimeStr;//预看时间
@property (nonatomic , strong) NSString *lookTypeStr;//看房类型
@property (nonatomic , strong) NSString *departmentAndTelephoneTitle;//部门电话
@property (nonatomic , strong) NSString *departmentAndTelephoneTitleStr;//部门电话信息
@property (nonatomic , strong) NSString *departurePlaceStr;//出发地
@property (nonatomic , strong) NSString *destinationStr;//目的地
@property (nonatomic , strong) NSString *peopleNumStr;//人数
@property (nonatomic , strong) NSString *buildingStr;//楼盘


@end
