//
//  LeftSideViewBuilding.h
//  CamperDriver
//
//  Created by JobNewMac1 on 16/10/21.
//  Copyright © 2016年 JobNew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftSideViewBuilding : UIViewController
@property (nonatomic ,strong) void (^clickAvtion)(NSInteger index);

@property (nonatomic , strong) UIButton *cachebtn;
- (void)updataCacheBtn;
@end
