//
//  LeftSideViewBuilding.m
//  CamperDriver
//
//  Created by JobNewMac1 on 16/10/21.
//  Copyright © 2016年 JobNew. All rights reserved.
//

#import "LeftSideViewBuilding.h"
#import "UserInfoSkills.h"
#import "MessageCountLabel.h"
#import "CacheTool.h"

@interface LeftSideViewBuilding ()
@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UIButton *lastButton;
@property (strong, nonatomic) MessageCountLabel *messageCountLabel;
@end

@implementation LeftSideViewBuilding

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ui];
    [self updateHeadAndNameUI];
    [WorldNotifyManager addUpdateUserInfoNotify:self Selector:@selector(updateUserfoAction:) object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UI
-(void)ui {
    
    self.view.backgroundColor = WhiteColor;
    
    [self.view addSubview:self.headImageView];
    [self.view addSubview:self.nickNameLabel];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        CGFloat height = isIphoneX==1?100:40;
        make.top.equalTo(self.view).with.offset(height);
        make.width.equalTo(@95);
        make.height.equalTo(self.headImageView.mas_width).multipliedBy(1);
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.headImageView.mas_bottom).with.offset(8);
        make.leading.equalTo(self.headImageView).with.offset(-5);
        make.height.greaterThanOrEqualTo(@0);
        make.height.lessThanOrEqualTo(@42);
    }];
    
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    versionStr = [@"版本 V " stringByAppendingString:versionStr];
    
    NSArray *tempArray1 = @[@"清理缓存",versionStr];
    
    [tempArray1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *title = (NSString *)obj;
        
        CGFloat top = idx * (45 + 23) + 35;
        
        UIButton *btn = [UIButton new];
        btn.tag = idx;
        btn.backgroundColor = WhiteColor;
        btn.titleLabel.font = LNFontFromeSize(@15);
        [btn LNCornerRadius:22.5];
        [btn LNControlStateNormalTitle:title];
        [btn LNBorderWithWidth:1 Color:LineColor];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
        [btn setTitleColor:MainWorldColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.nickNameLabel.mas_bottom).with.offset(top);
            make.width.equalTo(@191);
            make.height.equalTo(@45);
        }];
        
        if (idx == 3) {
            [self.view addSubview:self.messageCountLabel];
            [self.messageCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@20);
                make.height.equalTo(@20);
                make.centerY.equalTo(btn.mas_centerY);
                make.centerX.equalTo(self.view).with.offset(45);
            }];
        }
        
        if (idx == 0) {
            self.cachebtn = btn;
            [self updataCacheBtn];
        }
    }];
}

-(void)ui2 {
    
    self.view.backgroundColor = WhiteColor;
    
    [self.view addSubview:self.headImageView];
    [self.view addSubview:self.nickNameLabel];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        CGFloat height = isIphoneX==1?100:40;
        make.top.equalTo(self.view).with.offset(height);
        make.width.equalTo(@95);
        make.height.equalTo(self.headImageView.mas_width).multipliedBy(1);
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.headImageView.mas_bottom).with.offset(8);
        make.leading.equalTo(self.headImageView).with.offset(-5);
        make.height.greaterThanOrEqualTo(@0);
        make.height.lessThanOrEqualTo(@42);
    }];
    
    NSArray *tempArray1 = @[@"行程",@"加油",@"钱包",@"消息",@"设置"];
    NSArray *tempArray2 = @[@"RedLocation",@"RedRefuel",@"RedWallet",@"RedMessage",@"RedSetting"];
    [tempArray1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *title = (NSString *)obj;
        NSString *image = tempArray2[idx];
        
        CGFloat top = idx * (45 + 23) + 35;
        
        UIButton *btn = [UIButton new];
        btn.tag = idx;
        btn.backgroundColor = WhiteColor;
        btn.titleLabel.font = LNFontFromeSize(@15);
        [btn LNCornerRadius:22.5];
        [btn LNControlStateNormalTitle:title];
        [btn LNBorderWithWidth:1 Color:LineColor];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
        [btn LNControlStateNormalImage:LNImageFromeName(image)];
        [btn setTitleColor:MainWorldColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.nickNameLabel.mas_bottom).with.offset(top);
            make.width.equalTo(@191);
            make.height.equalTo(@45);
        }];
        
        if (idx == 3) {
            [self.view addSubview:self.messageCountLabel];
            [self.messageCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@20);
                make.height.equalTo(@20);
                make.centerY.equalTo(btn.mas_centerY);
                make.centerX.equalTo(self.view).with.offset(45);
            }];
        }
        
    }];
}

- (void)updataCacheBtn {
    NSString *ct = [CacheTool getCacheSizeWithFilePath];
    ct = [NSString stringWithFormat:@"清理缓存 %@",ct];
    [self.cachebtn LNControlStateNormalTitle:ct];
}

-(void)updateHeadAndNameUI {
    [self updateHeadUI];
    [self updateNameUI];
}

-(void)updateHeadAndCarNumberPlateUI {
        [self updateHeadUI];
    [self updateCarNumberPlateUI];
}
-(void)updateHeadUI {
    NSString *head = [UserInfoSkills getUserInfo:UserInfoSkillsType_HeadPortrait];
    LNImageFromeUrl(self.headImageView, head);
}

-(void)updateNameUI {
    NSString *name = [UserInfoSkills getUserInfo:UserInfoSkillsType_RealName];
    self.nickNameLabel.text = name;
}
-(void)updateCarNumberPlateUI {
    NSString *name = [UserInfoSkills getUserInfo:UserInfoSkillsType_CarNumberPlate];
    self.nickNameLabel.text = name;
}

#pragma mark event response
-(void)headAction {
    if (self.clickAvtion) {
        self.clickAvtion(-1);
    }
}

-(void)updateUserfoAction:(NSNotification *)notify {
    [self updateHeadAndNameUI];
}

-(void)btnAction:(UIButton *)sender {
    if (self.lastButton) {
        [self.lastButton LNBorderWithWidth:1 Color:LineColor];
    }
    self.lastButton = sender;
    [sender LNBorderWithWidth:1 Color:MainColor];
    
    if (sender.tag == 0) {
        [CacheTool clearSize];
        sleep(0.5);
        [self updataCacheBtn];
    }else{
        return;
    }
    if (self.clickAvtion ) {
        self.clickAvtion(sender.tag);
    }
}

#pragma mark setter and getter
-(UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [UIImageView new];
        [_headImageView LNCornerRadius:47.5];
        [_headImageView LNAddTapAction:@selector(headAction) Target:self];
    }
    return _headImageView;
}

-(UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel = [UILabel new];
        _nickNameLabel.numberOfLines = 2;
        _nickNameLabel.textAlignment = NSTextAlignmentCenter;
        _nickNameLabel.font = LNFontFromeSize(@15);
    }
    return _nickNameLabel;
}

-(MessageCountLabel *)messageCountLabel {
    if (!_messageCountLabel) {
        _messageCountLabel = [MessageCountLabel new];
        _messageCountLabel.textColor = WhiteColor;
        _messageCountLabel.backgroundColor = [UIColor redColor];
        _messageCountLabel.hidden = YES;
        _messageCountLabel.font = [UIFont systemFontOfSize:10];
        [_messageCountLabel LNCornerRadius:10];
        [_messageCountLabel addNotify];
    }
    return _messageCountLabel;
}

@end
