//
//  VersionView.h
//  CamperDriver
//
//  Created by WFW on 2018/2/2.
//  Copyright © 2018年 JobNew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionView : UIView

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *line;
@property (weak, nonatomic) IBOutlet UIButton *btn01;
@property (weak, nonatomic) IBOutlet UIButton *btn02;
@property (weak, nonatomic) IBOutlet UIButton *btn03;


@property (nonatomic ,strong) NSString *updateUrl;
@property (nonatomic ,strong) void (^updateVersion)(NSString *url);

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgViewLayoutContr;

- (IBAction)updateBtn:(UIButton *)sender;
- (IBAction)btnAtion:(UIButton *)sender;


- (void)showViewWithAbility:(NSString *)ability updateExplain:(NSString *)explain url:(NSString*)url;



@end
