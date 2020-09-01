// By @CrazyMind90

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#pragma clang diagnostic ignored "-Wnullability-completeness"

#import <UIKit/UIKit.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <Photos/Photos.h>

#define rgbValue
#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width

#define SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height


 

@interface CMManager : UIViewController <CAAnimationDelegate, UIScrollViewDelegate>



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

+(UIView *_Nullable) InitViewWithBGColor:(UIColor *_Nullable)BGColor Frame:(CGRect)Frame Blur:(BOOL)Blur BackgroundImage:(UIImage *_Nullable)BackgroundImage InView:(UIView *_Nullable)InView;

+(UIView *_Nullable) InitViewWithBGColor:(UIColor *_Nullable)BGColor Frame:(CGRect)Frame BackgroundImage:(UIImage *_Nullable)BackgroundImage  InView:(UIView *_Nullable)InView;

+(UILabel *_Nullable) InitLabelWithName:(NSString *_Nullable)Name TextAlignment:(NSTextAlignment)TextAlignment LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;

+(UILabel *_Nullable) InitLabelWithName:(NSString *_Nullable)Name Frame:(CGRect)frame InView:(UIView *_Nullable)InView;

+(UILabel *_Nullable) InitLabelInsideViewWithName:(NSString *_Nullable)Name TextAlignment:(NSTextAlignment)TextAlignment TextColor:(UIColor *_Nullable)TextColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;

+(UIButton *_Nullable) InitButtonInsideViewWithName:(NSString *_Nullable)BuName LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)View Target:(id _Nullable)Target Action:(SEL _Nullable )Action;


+(void) InitAlertWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle AlertStyle:(UIAlertControllerStyle)AlertStyle handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler;


+(void) InitAlertWithTitle:(NSString *_Nullable)Title TitleColor:(UIColor *_Nullable)TitleColor Message:(NSString *_Nullable)Message MessageColor:(UIColor *_Nullable)MessageColor Buttons:(NSArray *_Nullable)Buttons CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle ButtonsColor:(UIColor *_Nullable)ButtonsColor ButtonsImage:(UIImage *_Nullable)ButtonsImage BackgroundColor:(UIColor *_Nullable)BackgroundColor AlertStyle:(UIAlertControllerStyle)AlertStyle handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler;
 
 

+(void) InitAlertInKeyWindowWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle AlertStyle:(UIAlertControllerStyle)AlertStyle handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler;


+(void) InitTextFieldAlertInKeyWindowWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle, NSString * _Nullable Text))handler;


+(UIImageView *_Nullable) InitImage:(UIImage *_Nullable)image LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;

+(UIImageView *_Nullable) InitImage:(UIImage *_Nullable)image Frame:(CGRect)Frame InView:(UIView *_Nullable)InView;


+(UIImage *_Nullable) BlureImage:(UIImage *_Nullable)image BlureLevel:(float)BlureLevel InView:(UIView *_Nullable)InView;


+(UISwitch *_Nonnull) InitSwitchInsideViewWithAction:(SEL _Nullable )Action LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView Target:(id _Nullable )Target;


+(void) BlurView:(UIView *_Nullable)View;


+(NSString *_Nonnull) CheckDeviceType;


+(BOOL) isIPhone_XS_MAX_XR_Screen;


+(BOOL) isIPhone_X_XS_Screen;


+(BOOL) isIPadScreen_12_9_inch;


+(BOOL) isIPadScreen_Small;


+(BOOL) isIPhone_7p_8p_Screen;


+(BOOL) isIPhone_7_8_Screen;


+(BOOL) isIPhone5Screen;



+(void)ViewToBeAnimated:(UIView *_Nullable)views delegate:(id _Nullable)delegate Duration:(float)Duration StartAnimationFrom:(CATransitionSubtype _Nullable)StartAnimationFrom;


+(UIScrollView *_Nullable) InitScrollViewWithBGColor:(UIColor *_Nullable)BGColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height Delegate:(id _Nullable )Delegate InView:(UIView *_Nullable)InView;


+(UIScrollView *_Nullable) InitScrollViewWithFrame:(CGRect)Frame BGColor:(UIColor *_Nullable)BGColor Delegate:(id _Nullable )Delegate InView:(UIView *_Nullable)InView;


+(BOOL) isDirectory:(NSString *_Nullable)Path;


+(UITextView *_Nullable) InitTextViewWithFrame:(CGRect)Frame BackgroundColor:(UIColor *_Nullable)BGColor TextColor:(UIColor *_Nullable)TextColor InView:(UIView *_Nullable)InView;


+(UITextView *_Nullable) InitTextViewWithBGColor:(UIColor *_Nullable)BGColor TextColor:(UIColor *_Nullable)TextColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView;


+(UINavigationBar *_Nullable) InitNavigationBarWithTitle:(NSString *_Nullable)Title Style:(UIBarStyle)Style LeftButton:(UIBarButtonSystemItem)LeftButton LeftButtonAction:(SEL _Nullable)LeftButtonAction RightButton:(UIBarButtonSystemItem)RightButton RightButtonAction:(SEL _Nullable)RightButtonAction InView:(UIView *_Nullable)InView Target:(id _Nullable)Target;
 

+(void) InitTextFieldAlertWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle, NSString * _Nullable Text))handler;


+(void) InitTextFieldAlertWithTitle:(NSString *_Nullable)Title TitleColor:(UIColor *_Nullable)TitleColor Message:(NSString *_Nullable)Message MessageColor:(UIColor *_Nullable)MessageColor Buttons:(NSArray *_Nullable)Buttons ButtonsColor:(UIColor *_Nullable)ButtonsColor ButtonsImage:(UIImage *_Nullable)ButtonsImage BackgroundColor:(UIColor *_Nullable)BackgroundColor TextFieldBGColor:(UIColor *_Nullable)TextFieldBGColor TextFieldTextColor:(UIColor *_Nullable)TextFieldTextColor CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle, NSString * _Nullable Text))handler;


+(CGRect) AboveTabBarDownNavigationBar;


+(CGRect) AboveTabBarDownNavigationController;

+(CGRect) InMiddleOfView:(UIView *_Nullable)View;


+(UINavigationController *_Nullable) InitNavigationControllerWithTitle:(NSString *_Nullable)Title TitleColor:(UIColor *_Nullable)TitleColor RightButtonTitle:(NSString *_Nullable)RightButtonTitle RightButtonAction:(SEL _Nullable )RightButtonAction LeftButtonTitle:(NSString *_Nullable)LeftButtonTitle LeftButtonAction:(SEL _Nullable)LeftButtonAction ButtonsColor:(UIColor *_Nullable)ButtonsColor BackgroundColor:(UIColor *_Nullable)BackgroundColor Target:(id _Nullable)Target InView:(UIView *_Nullable)InView;


+(UITextField *_Nullable) InitTextFieldWithFrame:(CGRect)Frame TextColor:(UIColor *_Nullable)TextColor BackgroundColor:(UIColor *_Nullable)BackgroundColor InView:(UIView *_Nullable)InView;

 

+(void) ResizeLayoutView:(UIView *_Nullable)View InView:(UIView *_Nullable)InView AnchorDirection:(id _Nullable)AnchorDirection Constant:(float)Constant;


+(void) ResizeLayoutView:(UIView *_Nullable)View InView:(UIView *_Nullable)InView LeftAnchor:(id _Nullable)LeftAnchor LeftAnchorConstant:(float)LeftAnchorConstant RightAnchor:(id _Nullable)RightAnchor RightAnchorConstant:(float)RightAnchorConstant TopAnchor:(id _Nullable)TopAnchor TopAnchorConstant:(float)TopAnchorConstant BottomAnchor:(id _Nullable)BottomAnchor BottomAnchorConstant:(float)BottomAnchorConstant;


+(UIActivityViewController *_Nullable) ShareItemAtPath:(NSString *_Nullable)Path InViewController:(UIViewController *_Nullable)InViewController;



+(void) ActivateTheFollowingCodeAfter:(float)Sleep handler:(void(^_Nullable)(void))handler;


+(void) StartDispatch:(void(^_Nullable)(void))StartDispatch EndDispath:(void(^_Nullable)(void))EndDispath;

+(void) StartDispatch:(void(^_Nullable)(void))StartDispatch;

+(void) AnimatedDismissView:(UIView *_Nullable)View Duration:(float)Duration Y:(float)DirectionY X:(float)DirectionX handler:(void(^_Nullable)(void))handler;



+(WKWebView *_Nullable) WebWithURL:(NSString *_Nullable)URL Frame:(CGRect)Frame InView:(UIView *_Nullable)InView;


+(UIPasteboard *_Nullable) CopyToClipboard:(id _Nullable)Copy;


+(NSString *_Nullable) PasteFromClipboard;


+(UIWindow *_Nullable) NewWindowWithView:(UIView *_Nullable)View;


+(void) DismissView:(id _Nullable)View;


+(UIMenuController *_Nullable) AddNewItemWithTitle:(NSString *_Nullable)Title InView:(UIView *_Nullable)InView Action:(SEL)Action;


+(NSString *_Nullable) ShortenURL:(NSString *_Nullable)URL;

 

+(void) RenameItemAtPath:(NSString *_Nullable)Path NewName:(NSString *_Nullable)NewName;




+(void) PlayVideoAtPath:(NSURL *_Nullable)Path InViewController:(id _Nullable)ViewController;




+(void) PlayAudioAtPath:(NSString *_Nullable)Path;




+(void) PlayAudioFromURL:(NSString *_Nullable)URL;



+(CGRect) AboveTabBar;



+(void) SaveFileAtPathToCameraRoll:(NSString *_Nullable)File SuccessHandler:(void(^_Nullable)(BOOL Success))SuccessHandler ErrorHandler:(void(^_Nullable)(NSError *Error))ErrorHandler;

 

@end

 
 




// NSTask.h
#import <Foundation/NSObject.h>

@class NSString, NSArray, NSDictionary;

@interface NSTask : NSObject

// Create an NSTask which can be run at a later time
// An NSTask can only be run once. Subsequent attempts to
// run an NSTask will raise.
// Upon task death a notification will be sent
//   { Name = NSTaskDidTerminateNotification; object = task; }
//

- (instancetype _Nullable)init;

// set parameters
// these methods can only be done before a launch
- (void)setLaunchPath:(NSString *_Nullable)path;
- (void)setArguments:(NSArray *_Nullable)arguments;
- (void)setEnvironment:(NSDictionary *_Nullable)dict;
// if not set, use current
- (void)setCurrentDirectoryPath:(NSString *_Nullable)path;
// if not set, use current

// set standard I/O channels; may be either an NSFileHandle or an NSPipe
- (void)setStandardInput:(id _Nullable)input;
- (void)setStandardOutput:(id _Nullable)output;
- (void)setStandardError:(id _Nullable)error;

// get parameters
- (NSString *_Nullable)launchPath;
- (NSArray *_Nullable)arguments;
- (NSDictionary *_Nullable)environment;
- (NSString *_Nullable)currentDirectoryPath;

// get standard I/O channels; could be either an NSFileHandle or an NSPipe
- (id _Nullable)standardInput;
- (id _Nullable)standardOutput;
- (id _Nullable)standardError;

// actions
- (void)launch;

- (void)interrupt; // Not always possible. Sends SIGINT.
- (void)terminate; // Not always possible. Sends SIGTERM.

- (BOOL)suspend;
- (BOOL)resume;

// status
- (int)processIdentifier;
- (BOOL)isRunning;

- (int)terminationStatus;

@end

@interface NSTask (NSTaskConveniences)

+ (NSTask *_Nullable)launchedTaskWithLaunchPath:(NSString *_Nullable)path arguments:(NSArray *_Nullable)arguments;
// convenience; create and launch

- (void)waitUntilExit;
// poll the runLoop in defaultMode until task completes

@end

FOUNDATION_EXPORT NSString * _Nullable const NSTaskDidTerminateNotification;




