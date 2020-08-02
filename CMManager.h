// By @CrazyMind90

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"


#import <UIKit/UIKit.h>

#define rgbValue
#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


@interface CMManager : UIViewController  


+(BOOL) DownloadLink:(NSString *_Nullable)DownloadLink ToPath:(NSString *_Nullable)ToPath;

+(void) UploadFile:(NSString *_Nullable)UploadFile PHPLink:(NSString *_Nullable)PHPLink PHPNameValue:(NSString *_Nullable)PHPNameValue;

+(BOOL) CreateFileAtPath:(NSString *_Nullable)CreateDirectoryAtPath;

+(BOOL) CreateDirectoryAtPath:(NSString *_Nullable)CreateDirectoryAtPath;

+(BOOL) MoveItemAtPath:(NSString *_Nullable)CopyItemAtPath ToPath:(NSString *_Nullable)ToPath;

+(BOOL) CopyItemAtPath:(NSString *_Nullable)CopyItemAtPath ToPath:(NSString *_Nullable)ToPath;

+(BOOL) RemoveItemAtPath:(NSString *_Nullable)RemoveItemAtPath;

+(BOOL) FileExistsAtPath:(NSString *_Nullable)FileExistsAtPath;

+(BOOL) CreatePlistAtPath:(NSString *_Nullable)CreatePlistAtPath NameWithoutExtension:(NSString *_Nullable)NameWithoutExtension;

+(id _Nullable) Generator:(NSUInteger)Num;

+(NSString *_Nullable) PlistPath:(NSString *_Nullable)PlistPath ObjectForKey:(NSString *_Nullable)ObjectForKey;

+(BOOL) PlistPath:(NSString *_Nullable)PlistPath SetValue:(id _Nullable )SetValue ForKey:(id _Nullable)ForKey;

+(void) SendGETtoPHP:(NSString *_Nullable)SendGETtoPHP;

+(id _Nullable ) DataPathWithFileOrDir:(NSString *_Nullable)DataPathWithFileOrDir;

+(id _Nullable ) BundlePathWithFileOrDir:(NSString *_Nullable)BundlePathWithFileOrDir;

+(BOOL) PlistPath:(NSString *_Nullable)PlistPath RemoveObjectForKey:(id _Nullable )RemoveObjectForKey;

+(NSArray *_Nullable) ContentOfDir:(NSString *_Nullable)ContentOfDir;

+(NSString *_Nullable) SizeOfFolder:(NSString *_Nullable)sizeOfFolder;

+(NSString *_Nullable)SizeOfFile:(NSString *_Nullable)SizeOfFile;

+(NSString *_Nullable) GetUDID;

+(UIButton *_Nullable) InitButtonWithName:(NSString *_Nullable)BuName Frame:(CGRect)frame InView:(UIView *_Nullable)View Target:(id _Nullable )Target Action:(SEL _Nullable )Action;

+(UIButton *_Nullable) InitButtonWithName:(NSString *_Nullable)BuName LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)View Target:(id _Nullable)Target Action:(SEL _Nullable )Action;

+(UIView *_Nullable) InitViewWithBGColor:(UIColor *_Nullable)BGColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height BlurEffect:(UIBlurEffect *_Nullable)BlurEffect InView:(UIView *_Nullable)InView;

+(UIView *_Nullable) InitViewWithFrame:(CGRect)frame InView:(UIView *_Nullable)InView;

+(UILabel *_Nullable) InitLabelWithName:(NSString *_Nullable)Name TextAlignment:(NSTextAlignment)TextAlignment LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;

+(UILabel *_Nullable) InitLabelWithName:(NSString *_Nullable)Name Frame:(CGRect)frame InView:(UIView *_Nullable)InView;

+(UILabel *_Nullable) InitLabelInsideViewWithName:(NSString *_Nullable)Name TextAlignment:(NSTextAlignment)TextAlignment TextColor:(UIColor *_Nullable)TextColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;

+(UIButton *_Nullable) InitButtonInsideViewWithName:(NSString *_Nullable)BuName LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)View Target:(id _Nullable)Target Action:(SEL _Nullable )Action;


+(void) InitAlertWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons Target:(id _Nullable)Target handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler;


+(void) InitAlertWithTitle:(NSString *_Nullable)Title TitleColor:(UIColor *_Nullable)TitleColor Message:(NSString *_Nullable)Message MessageColor:(UIColor *_Nullable)MessageColor Buttons:(NSArray *_Nullable)Buttons CancelButton:(BOOL)CancelButton ButtonsColor:(UIColor *_Nullable)ButtonsColor ButtonsImage:(UIImage *_Nullable)ButtonsImage BackgroundColor:(UIColor *_Nullable)BackgroundColor AlertStyle:(UIAlertControllerStyle)AlertStyle Target:(id _Nullable)Target handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler;
 
 
+(UIImageView *_Nullable) InitImage:(UIImage *_Nullable)image LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;

+(UIImageView *_Nullable) InitImage:(UIImage *_Nullable)image Frame:(CGRect)Frame InView:(UIView *_Nullable)InView;


+(UIImage *_Nullable) BlureImage:(UIImage *_Nullable)Blure;


+(UISwitch *_Nonnull) InitSwitchInsideViewWithAction:(SEL _Nullable )Action LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView Target:(id _Nullable )Target;

@end

 
