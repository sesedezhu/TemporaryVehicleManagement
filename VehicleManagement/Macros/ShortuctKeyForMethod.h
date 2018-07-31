
//#import "NSString+LNCustomSkill.h"
//#import "WorldFileMap.h"
//#import "UIImageView+WebCache.h"


#ifdef DEBUG
//调试状态

#define LNDEBUG 1
#else
//发布状态
#define LNDEBUG 0
#endif

#define LNString      if (LNDEBUG) [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define LNprintf(...) if (LNDEBUG) printf("%s: %s 第%d行: %s\n\n",[[IWCommon getCurrentDate] UTF8String], [MyString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#define LNDLog(fmt, ...) if (LNDEBUG) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define LNDLogline  if (LNDEBUG) NSLog((@"%s [Line %d] "), __PRETTY_FUNCTION__, __LINE__);



#define WorldAppHaveNoImagePlaceHolder [UIImage imageNamed:@"UserPlaceHolder"]

#define MainStoryBoard [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]

#define LNLoadStoryBoardFromName(a) [UIStoryboard storyboardWithName:a bundle:[NSBundle mainBundle]]

#define LNLoadNibFromeName(nibName)  [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]]
#define LNLoadViewFromNib(nibName) [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] lastObject]
#define LNLoadViewsFromNib(nibName) [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil]

#define LNHiddenBuildingNavagtionBar self.navigationController.navigationBar.hidden = YES
#define LNShowBuildingNavagtionBar self.navigationController.navigationBar.hidden = NO

#define LNImageFromeName(imageName) [UIImage imageNamed:imageName]
#define LNFontFromeSize(size) [UIFont systemFontOfSize:[size floatValue]]

#define LNImageFromeUrl(a,b) [a sd_setImageWithURL:[b LNConvertStringToURL] placeholderImage:WorldAppHaveNoImagePlaceHolder]

#define LNGetPathFromBundle(a,b) [[NSBundle mainBundle] pathForResource:a ofType:b]

#define LNScreenWidth     [UIScreen mainScreen].bounds.size.width
#define LNScreenHeight    [UIScreen mainScreen].bounds.size.height
#define LNColorFromeHexSting(hex) [UIColor LNcolorWithHexString:hex]

#define LNTableviewCellSelectionStyleNone self.selectionStyle = UITableViewCellSelectionStyleNone

#define LNLoadBuildingFormMainBundleStoryBord(a,b) [[UIStoryboard storyboardWithName:a bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:b]

#define LNWordName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] //app名称
#define LNWordAge [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] //app版本
#define LNWordAgeBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]//app build号

#define LNAddNotifyToDefaultCenter(a,b,c,d) [[NSNotificationCenter defaultCenter] addObserver:a selector:b name:c object:d] ///添加通知
#define LNRemoveNotifyFromeDefautCenter(a,b,c) [[NSNotificationCenter defaultCenter] removeObserver:a name:b object:c] //移除通知
#define LNPostNotifyFromeDefautCenter(a,b,c) [[NSNotificationCenter defaultCenter] postNotificationName:a object:b userInfo:b] //发送通知

#define LNApplication [UIApplication sharedApplication]
#define LNAppDelegate [UIApplication sharedApplication].delegate
///app windows
#define LNApplicationWindows [LNAppDelegate window]

#define LNUserdefauts [NSUserDefaults standardUserDefaults]

#define LNAppTopHeight  self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height

#define LNCallPhone(phone) [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"tel:%@",phone]]]

#define LNApplicationHttpURL(http) [LNApplication openURL:[NSURL URLWithString:http]]

//判断是否为ipon x
#define isIphoneX (LNScreenHeight == 812.0 ? 1 : 0)









