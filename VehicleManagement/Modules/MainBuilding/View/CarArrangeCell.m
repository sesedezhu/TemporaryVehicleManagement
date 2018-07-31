//
//  CarArrangeCell.m
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/26.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "CarArrangeCell.h"

@implementation CarArrangeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setLookTimeStr:(NSString *)lookTimeStr {
    _lookTimeStr = lookTimeStr;
    self.lookTimeLabel.text = [NSString stringWithFormat:@"预看时间:%@",lookTimeStr];
}

-(void)setLookTypeStr:(NSString *)lookTypeStr{
    _lookTypeStr = lookTypeStr;
    self.lookTypeLabel.text = [NSString stringWithFormat:@"看客:%@",lookTypeStr];
}

-(void)setDepartmentAndTelephoneTitle:(NSString *)departmentAndTelephoneTitle{
    _departmentAndTelephoneTitle = departmentAndTelephoneTitle;
    self.departmentAndTelephoneTitleLabel.text = departmentAndTelephoneTitle;
}

-(void)setDepartmentAndTelephoneTitleStr:(NSString *)departmentAndTelephoneTitleStr{
    _departmentAndTelephoneTitleStr = departmentAndTelephoneTitleStr;
    self.departmentAndTelephoneTitleStrLabel.text = departmentAndTelephoneTitleStr;
}

-(void)setDeparturePlaceStr:(NSString *)departurePlaceStr{
    _departurePlaceStr = departurePlaceStr;
    self.departurePlaceLabel.text = [NSString stringWithFormat:@"出发地:%@",departurePlaceStr];
}

-(void)setDestinationStr:(NSString *)destinationStr{
    _destinationStr = destinationStr;
    self.destinationLabel.text = [NSString stringWithFormat:@"目的地:%@",destinationStr];
}

-(void)setPeopleNumStr:(NSString *)peopleNumStr{
    _peopleNumStr = peopleNumStr;
    self.peopleNumLabel.text = [NSString stringWithFormat:@"%@人",peopleNumStr];
}

-(void)setBuildingStr:(NSString *)buildingStr{
    _buildingStr = buildingStr;
    self.buildingLabel.text = [NSString stringWithFormat:@"楼盘:%@",buildingStr];
}

@end
