// By @CrazyMind90

 
#import "CMManager.h"


@interface UIDevice ()

-(id)_deviceInfoForKey:(NSString *)key;

@end




@implementation CMManager 

 

+(CGRect) InMiddleOfView:(UIView *_Nullable)View {
    
    
    return CGRectMake(View.frame.size.width*0.2*1.2, View.frame.size.height*0.3, View.frame.size.width*0.5, View.frame.size.height*0.2*1.2);
}

+(CGRect) AboveTabBarDownNavigation {
    
    float FinalResult = 0;
    float ScreeResult = 0;
        if ([CMManager isIPadScreen_Small]) {
      
        NSLog(@"iPad Small Screen Detected");
        FinalResult = SCREEN_HEIGHT/1.2 + 30;
        ScreeResult = SCREEN_HEIGHT/11 - 3;
        
    } else if ([CMManager isIPadScreen_12_9_inch]) {
    
        NSLog(@"iPad 12_9_inch Screen Detected");
        FinalResult = SCREEN_HEIGHT/1.2 + 54;
        ScreeResult = SCREEN_HEIGHT/13 - 2;
        
    } else if ([CMManager isIPhone_XS_MAX_XR_Screen]) {
        
        NSLog(@"isIPhone_XS_MAX_XR_Screen");
        FinalResult = SCREEN_HEIGHT/1.2 + 5;
        ScreeResult = SCREEN_HEIGHT/12;
    
    } else if ([CMManager isIPhone_X_XS_Screen]) {
        
        NSLog(@"isIPhone_X_XS_Screen");
        FinalResult = SCREEN_HEIGHT/1.2 - 8;
        ScreeResult = SCREEN_HEIGHT/11;
        
    } else if ([CMManager isIPhone_7p_8p_Screen]) {
        
         NSLog(@"isIPhone_7p_8p_Screen");
        FinalResult = SCREEN_HEIGHT/1.2 + 1;
        ScreeResult = SCREEN_HEIGHT/10 - 1;
        
    } else if ([CMManager isIPhone_7_8_Screen]) {
        
         NSLog(@"isIPhone_7_8_Screen");
        FinalResult = SCREEN_HEIGHT/1.2 - 7;
        ScreeResult = SCREEN_HEIGHT/10 + 3;
        
    } else if ([CMManager isIPhone5Screen]) {
        
         NSLog(@"isIPhone5Screen");
        FinalResult = SCREEN_HEIGHT/1.2 - 12;
        ScreeResult = SCREEN_HEIGHT/10;
    }
    
    
    
   return CGRectMake(0, ScreeResult, SCREEN_WIDTH, FinalResult);
}


+(void) InitTextFieldAlertWithTitle:(NSString *_Nullable)Title TitleColor:(UIColor *_Nullable)TitleColor Message:(NSString *_Nullable)Message MessageColor:(UIColor *_Nullable)MessageColor Buttons:(NSArray *_Nullable)Buttons ButtonsColor:(UIColor *_Nullable)ButtonsColor ButtonsImage:(UIImage *_Nullable)ButtonsImage BackgroundColor:(UIColor *_Nullable)BackgroundColor TextFieldBGColor:(UIColor *_Nullable)TextFieldBGColor TextFieldTextColor:(UIColor *_Nullable)TextFieldTextColor CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle Target:(id _Nullable)Target handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle, NSString * _Nullable Text))handler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {


        textField.keyboardType = UIKeyboardTypeDefault;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [textField resignFirstResponder];
        textField.backgroundColor = TextFieldBGColor;
        textField.textColor = TextFieldTextColor;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.keyboardAppearance = UIKeyboardAppearanceDark;


    }];
    
         for (NSString *EachButton in Buttons) {
             
        NSArray *fields = alert.textFields;
        UITextField *getText = [fields firstObject];
    
        UIAlertAction *action = [UIAlertAction actionWithTitle:EachButton style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                  
            handler(action.title,getText.text);
    
                   }];
            
           
     [alert addAction:action];

     [action setValue:ButtonsColor forKey:@"titleTextColor"];

     [action setValue:[ButtonsImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:@"image"];
             
    }
    
    
    // BackgroundColor

    UIView *firstSubview = alert.view.subviews.firstObject;

    UIView *alertContentView = firstSubview.subviews.firstObject;

    for (UIView *subSubView in alertContentView.subviews) {

        subSubView.backgroundColor = BackgroundColor;

    }
    
    


    // TitleColor

     UIColor *color = TitleColor;

     NSString *string = Title;

     NSDictionary *attrs = @{ NSForegroundColorAttributeName:color};

     NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];

     [alert setValue:attrStr forKey:@"attributedTitle"];





    // MessageColor

     UIColor *color1 = MessageColor;

     NSString *string1 = Message;

     NSDictionary *attrs1 = @{ NSForegroundColorAttributeName:color1};

     NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString:string1 attributes:attrs1];

     [alert setValue:attrStr1 forKey:@"attributedMessage"];

 
    
    if (!(CancelButtonTitle == NULL)) {
        
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:CancelButtonTitle  style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                                                         
    
    }];

    
    [alert addAction:cancelAction];
        
     //CancelColor
    [cancelAction setValue:UIColor.redColor forKey:@"titleTextColor"];

        
    }
    
    [Target presentViewController:alert animated:YES completion:nil];

    
    
}



   


      
+(void) InitTextFieldAlertWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons CancelButtonTitle:(NSString *_Nullable)CancelButtonTitle Target:(id _Nullable)Target handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle, NSString * _Nullable Text))handler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {


        textField.keyboardType = UIKeyboardTypeDefault;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [textField resignFirstResponder];


    }];
    
         for (NSString *EachButton in Buttons) {
             
        NSArray *fields = alert.textFields;
        UITextField *getText = [fields firstObject];
    
        UIAlertAction *action = [UIAlertAction actionWithTitle:EachButton style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                  
            handler(action.title,getText.text);
    
                   }];
            
           
        [alert addAction:action];

    }
    

    
    if (!(CancelButtonTitle == NULL)) {
        
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:CancelButtonTitle  style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                                                         
    
    }];

    
    [alert addAction:cancelAction];
        
    }
    
    [Target presentViewController:alert animated:YES completion:nil];

    
    
}



+(UINavigationBar *_Nullable) InitNavigationBarWithTitle:(NSString *_Nullable)Title Style:(UIBarStyle)Style LeftButton:(UIBarButtonSystemItem)LeftButton LeftButtonAction:(SEL _Nullable)LeftButtonAction RightButton:(UIBarButtonSystemItem)RightButton RightButtonAction:(SEL _Nullable)RightButtonAction InView:(UIView *_Nullable)InView Target:(id _Nullable)Target {


    UINavigationBar *NavigBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/26, InView.frame.size.width, 45)];

    NavigBar.barStyle = Style;
    UINavigationItem *NaviItem = [[UINavigationItem alloc] initWithTitle:Title];



//    UIBarButtonItem *G = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"A"] style:UIBarButtonItemStylePlain target:self action:@selector(onTapDone:)];

//    navItem.rightBarButtonItem = G;
//    navItem.backBarButtonItem
    // [navbar setBarTintColor:[UIColor lightGrayColor]];
    
    
    UIBarButtonItem *CancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:LeftButton target:Target action:LeftButtonAction];
    NaviItem.leftBarButtonItem = CancelButton;

    UIBarButtonItem *DoneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:RightButton target:Target action:RightButtonAction];
    NaviItem.rightBarButtonItem = DoneButton;



    [NavigBar setItems:@[NaviItem]];
    [InView addSubview:NavigBar];
    
    return NavigBar;
}


+(UITextView *_Nullable) InitTextViewWithFrame:(CGRect)Frame BackgroundColor:(UIColor *_Nullable)BGColor TextColor:(UIColor *_Nullable)TextColor InView:(UIView *_Nullable)InView {
    
    UITextView *TextV = [[UITextView alloc] initWithFrame:Frame];
    
    TextV.backgroundColor = BGColor;
    TextV.textColor = TextColor;
    
    [InView addSubview:TextV];
    
    return TextV;
}

+(UITextView *_Nullable) InitTextViewWithBGColor:(UIColor *_Nullable)BGColor TextColor:(UIColor *_Nullable)TextColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView {
    
    CGRect LFrame = CGRectMake(InView.frame.size.width*LeftRight, InView.frame.size.height*UpDown, InView.frame.size.width*Width, InView.frame.size.height*Height);

    UITextView *TextV = [[UITextView alloc] initWithFrame:LFrame];
    
    TextV.backgroundColor = BGColor;
    TextV.textColor = TextColor;
    
    [InView addSubview:TextV];
    
    return TextV;
    
}



+(BOOL) isDirectory:(NSString *_Nullable)Path {

BOOL Directory = NO;
    
if ([[NSFileManager defaultManager] fileExistsAtPath:Path isDirectory:&Directory] && Directory)
    Directory = YES;
    
    return Directory;
}

+(UIScrollView *_Nullable) InitScrollViewWithBGColor:(UIColor *_Nullable)BGColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height Delegate:(id)Delegate InView:(UIView *_Nullable)InView {
    
    
      CGRect LFrame = CGRectMake(InView.frame.size.width*LeftRight, InView.frame.size.height*UpDown, InView.frame.size.width*Width, InView.frame.size.height*Height);
    
    UIScrollView *ScrollView = [[UIScrollView alloc] initWithFrame:LFrame];
    
    ScrollView.delegate = Delegate;
    ScrollView.backgroundColor = BGColor;
    ScrollView.showsVerticalScrollIndicator = YES;
    ScrollView.scrollEnabled = YES;
    ScrollView.userInteractionEnabled = YES;
    [InView addSubview:ScrollView];
    
    return ScrollView;
}

+(UIScrollView *_Nullable) InitScrollViewWithFrame:(CGRect)Frame BGColor:(UIColor *_Nullable)BGColor Delegate:(id)Delegate InView:(UIView *_Nullable)InView {
    
    
    UIScrollView *ScrollView = [[UIScrollView alloc] initWithFrame:Frame];
    
    ScrollView.delegate = Delegate;
    ScrollView.backgroundColor = BGColor;
    ScrollView.showsVerticalScrollIndicator = YES;
    ScrollView.scrollEnabled = YES;
    ScrollView.userInteractionEnabled = YES;
    [InView addSubview:ScrollView];
    
    return ScrollView;
    
}

+(void)ViewToBeAnimated:(UIView *_Nullable)views delegate:(id _Nullable)delegate Duration:(float)Duration StartAnimationFrom:(CATransitionSubtype _Nullable)StartAnimationFrom {
    
    CATransition *transition = nil;
    transition = [CATransition animation];
    transition.duration = Duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = StartAnimationFrom;
    transition.delegate = delegate;
    [views.layer addAnimation:transition forKey:nil];
    
}


+(UIImage *) imageFromView:(UIView *)view {

    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(currentContext, 0, view.frame.size.height);

    CGContextScaleCTM(currentContext, 1.0, -1.0);
    [[view layer] renderInContext:currentContext];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

+(id _Nullable) BlurView:(UIView *_Nullable)View {
    
    
    UIView *NewBlurView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UIGraphicsBeginImageContextWithOptions(View.bounds.size, View.opaque, 0.0f);
    [View drawViewHierarchyInRect:View.bounds afterScreenUpdates:NO];
    UIImage *IMM = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    imageView.image = IMM;
    
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:imageView.image.CGImage];

    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:20.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];


    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];

    UIImage *retVal = [UIImage imageWithCGImage:cgImage];
    
    imageView.image = retVal;
 
    [NewBlurView addSubview:imageView];



    UIGraphicsBeginImageContextWithOptions(NewBlurView.bounds.size, NewBlurView.opaque, 0.0);
    [NewBlurView.layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *FinalRe = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

      return FinalRe;


}



+(NSString *_Nonnull) CheckDeviceType {
    size_t size = 100;
    char *hw_machine = malloc(size);
    int name[] = {CTL_HW,HW_MACHINE};
    sysctl(name, 2, hw_machine, &size, NULL, 0);
    NSString *hardware = [NSString stringWithUTF8String:hw_machine];
    free(hw_machine);
    
    return hardware;
}



+(BOOL) isIPhone_XS_MAX_XR_Screen {
    
    BOOL isIPhone_XS_MAX_XR_Screen;
    
       if (SCREEN_HEIGHT == 896)
           isIPhone_XS_MAX_XR_Screen = YES;
           else
           isIPhone_XS_MAX_XR_Screen = NO;
           
    
    return isIPhone_XS_MAX_XR_Screen;
}


+(BOOL) isIPhone_X_XS_Screen {
    
    BOOL isIPhone_X_XS_Screen;
    
       if (SCREEN_HEIGHT == 812)
           isIPhone_X_XS_Screen = YES;
           else
           isIPhone_X_XS_Screen = NO;
           
    
    return isIPhone_X_XS_Screen;
}



+(BOOL) isIPadScreen_12_9_inch {
    
    BOOL isIPadScreen_12_9_inch;
    
       if (SCREEN_HEIGHT > 1300)
           isIPadScreen_12_9_inch = YES;
           else
           isIPadScreen_12_9_inch = NO;
           
    
    return isIPadScreen_12_9_inch;
}




+(BOOL) isIPadScreen_Small {
    
    BOOL isIPadScreen_Small;
    
       if (SCREEN_HEIGHT > 900 && SCREEN_HEIGHT < 1300)
           isIPadScreen_Small = YES;
           else
           isIPadScreen_Small = NO;
           
    
    return isIPadScreen_Small;
}


+(BOOL) isIPhone_7p_8p_Screen {
    
    BOOL isIPhone_7p_8p_Screen;
    
       if (SCREEN_HEIGHT == 736)
           isIPhone_7p_8p_Screen = YES;
           else
           isIPhone_7p_8p_Screen = NO;
           
    
    return isIPhone_7p_8p_Screen;
    
}


+(BOOL) isIPhone_7_8_Screen {
    
    BOOL isIPhone_7_8_Screen;
    
       if (SCREEN_HEIGHT == 667)
           isIPhone_7_8_Screen = YES;
           else
           isIPhone_7_8_Screen = NO;
           
    
    return isIPhone_7_8_Screen;
    
}



+(BOOL) isIPhone5Screen {
    
    BOOL isIPhone5Screen;
    
       if (SCREEN_HEIGHT <= 568)
           
           isIPhone5Screen = YES;
           else
           isIPhone5Screen = NO;
           
    
    return isIPhone5Screen;
    
}


+(UISwitch *_Nonnull) InitSwitchInsideViewWithAction:(SEL _Nullable )Action LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView Target:(id _Nullable )Target {
    
        CGRect LFrame = CGRectMake(InView.frame.size.width*LeftRight, InView.frame.size.height*UpDown, InView.frame.size.width*Width, InView.frame.size.height*Height);
    
        UISwitch *Switch = [[UISwitch alloc] initWithFrame:LFrame];
    
        [Switch addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
 
        Switch.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
  
        [InView addSubview:Switch];
     
     
     return Switch;
    
}
 
 
 

+(UIImage *_Nullable) BlureImage:(UIImage *_Nullable)image BlureLevel:(float)BlureLevel {

  UIView *ff = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];

  UIImage *sourceImage = image;
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:sourceImage.CGImage];

    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:BlureLevel] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];


    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];

    UIImage *retVal = [UIImage imageWithCGImage:cgImage];

    if (cgImage) {
        CGImageRelease(cgImage);
    }

  imageView.image = retVal;
  [ff addSubview:imageView];


  UIGraphicsBeginImageContextWithOptions(ff.bounds.size, ff.opaque, 0.0);
  [ff.layer renderInContext:UIGraphicsGetCurrentContext()];

  UIImage * img = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return img;

}
 
+(UIImageView *_Nullable) InitImage:(UIImage *_Nullable)image Frame:(CGRect)Frame InView:(UIView *_Nullable)InView {
    
 
      UIImageView *ImageView = [[UIImageView alloc] initWithFrame:Frame];
    
      ImageView.image = image;
      
      ImageView.layer.masksToBounds = YES;
      
      [InView addSubview:ImageView];
      
      return ImageView;
}

+(UIImageView *_Nullable) InitImage:(UIImage *_Nullable)image LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *_Nullable)InView {
    
    CGRect ImFrame = CGRectMake(InView.frame.size.width*LeftRight, InView.frame.size.height*UpDown, InView.frame.size.width*Width, InView.frame.size.height*Height);
    
    UIImageView *ImageView = [[UIImageView alloc] initWithFrame:ImFrame];
  
    ImageView.image = image;
    
    ImageView.layer.masksToBounds = YES;
    
    [InView addSubview:ImageView];
    
    return ImageView;
}
 
+(void) InitAlertWithTitle:(NSString *_Nullable)Title TitleColor:(UIColor *_Nullable)TitleColor Message:(NSString *_Nullable)Message MessageColor:(UIColor *_Nullable)MessageColor Buttons:(NSArray *_Nullable)Buttons CancelButton:(BOOL)CancelButton ButtonsColor:(UIColor *_Nullable)ButtonsColor ButtonsImage:(UIImage *_Nullable)ButtonsImage BackgroundColor:(UIColor *_Nullable)BackgroundColor AlertStyle:(UIAlertControllerStyle)AlertStyle Target:(id _Nullable)Target handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler {
    
    
 
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:AlertStyle];
    
         for (NSString *EachButton in Buttons) {
    
        UIAlertAction *action = [UIAlertAction actionWithTitle:EachButton style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                  
            handler(action.title);
    
                   }];
            
           
        [alert addAction:action];
             
        [action setValue:ButtonsColor forKey:@"titleTextColor"];

        [action setValue:[ButtonsImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:@"image"];

    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"  style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                                                         
    
    }];
       
    
       
       // BackgroundColor
       UIView *firstSubview = alert.view.subviews.firstObject;
       UIView *alertContentView = firstSubview.subviews.firstObject;
       for (UIView *subSubView in alertContentView.subviews) {
           subSubView.backgroundColor = BackgroundColor;
       }
       
    
       // TitleColor
        UIColor *color = TitleColor;
        NSString *string = Title;
        NSDictionary *attrs = @{ NSForegroundColorAttributeName:color};
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];

        [alert setValue:attrStr forKey:@"attributedTitle"];


       // MessageColor
        UIColor *color1 = MessageColor;
        NSString *string1 = Message;
        NSDictionary *attrs1 = @{ NSForegroundColorAttributeName:color1};
        NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString:string1 attributes:attrs1];

        [alert setValue:attrStr1 forKey:@"attributedMessage"];


    
        //CancelColor
        [cancelAction setValue:UIColor.redColor forKey:@"titleTextColor"];
         
     if (CancelButton)
        [alert addAction:cancelAction];


        [Target presentViewController:alert animated:YES completion:nil];
       
        
    
}



+(void) InitAlertWithTitle:(NSString *_Nullable)Title Message:(NSString *_Nullable)Message Buttons:(NSArray *_Nullable)Buttons AlertStyle:(UIAlertControllerStyle)AlertStyle Target:(id _Nullable)Target handler:(void(^_Nullable)(NSString * _Nullable ButtonTitle))handler {

    
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:AlertStyle];
 
      for (NSString *EachButton in Buttons) {
 
     UIAlertAction *action = [UIAlertAction actionWithTitle:EachButton style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
               
         handler(action.title);
 
                }];
         
        
     [alert addAction:action];
 }
 UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"  style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                                                      
 
 }];
     
    
 
 [alert addAction:cancelAction];
 [Target presentViewController:alert animated:YES completion:nil];
    
     
}


+(UIButton *) InitButtonInsideViewWithName:(NSString *)BuName LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *)InView Target:(id)Target Action:(SEL)Action {
     
     
     CGRect LFrame = CGRectMake(InView.frame.size.width*LeftRight, InView.frame.size.height*UpDown, InView.frame.size.width*Width, InView.frame.size.height*Height);
 
    
        UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        Button.frame = LFrame;
      
        Button.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);

        [Button setTitle:BuName forState:UIControlStateNormal];

        
        [Button addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [InView addSubview:Button];
     
     
     return Button;
     
 }


+(UIButton *) InitButtonWithName:(NSString *)BuName Frame:(CGRect)frame InView:(UIView *)View Target:(id)Target Action:(SEL)Action {
 
    
       UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
       
       Button.frame = frame;
     

       [Button setTitle:BuName forState:UIControlStateNormal];

       
       [Button addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
       
       
       
       [View addSubview:Button];
    
    
    return Button;
    
}

 


+(void) Target:(id)Target Perfomrer:(SEL)Perf {
    
    
          [Target performSelector:Perf];

    
}

+(UIButton *) InitButtonWithName:(NSString *)BuName LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *)View Target:(id)Target Action:(SEL)Action {
    
        float LeftNRight = [UIScreen mainScreen].bounds.size.width;
        float UpAndDown = [UIScreen mainScreen].bounds.size.height;

        float width = [UIScreen mainScreen].bounds.size.width;
        float height = [UIScreen mainScreen].bounds.size.height;
    
       CGRect BFrame = CGRectMake(LeftNRight*LeftRight, UpAndDown*UpDown, width*Width, height*Height);

       UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
       
       Button.frame = BFrame;
     
       Button.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);

       [Button setTitle:BuName forState:UIControlStateNormal];

       
    [Button addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
       
       
       
       [View addSubview:Button];
    
    
    return Button;
    
}



+(UIView *_Nullable) InitViewWithBGColor:(UIColor *_Nullable)BGColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height Blur:(BOOL)Blur BackgroundImage:(UIImage *_Nullable)BackgroundImage InView:(UIView *_Nullable)InView {
    
    

   
    CGRect BFrame = CGRectMake(SCREEN_WIDTH/LeftRight, SCREEN_HEIGHT/UpDown, SCREEN_WIDTH/Width, SCREEN_HEIGHT/Height);


    UIView *View = [[UIView alloc] initWithFrame:BFrame];
    
    
    if (Blur) {
        
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

    blurEffectView.frame = View.bounds;

    blurEffectView.layer.cornerRadius = 20;
    blurEffectView.layer.masksToBounds = YES;


    [View addSubview:blurEffectView];
    
    }

    View.backgroundColor = BGColor;
    
    View.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    
    UIImageView *IMView = [[UIImageView alloc] initWithImage:BackgroundImage];

//    UIImage *Image = BackgroundImage;
    IMView.layer.masksToBounds = YES;
    
//    IMView.image = BackgroundImage;
    
    IMView.layer.cornerRadius = 20;
    
    View.layer.contents = CFBridgingRelease((IMView.image.CGImage));
       
    [InView addSubview:View];

    return View;
    
}


+(UIView *_Nullable) InitViewWithBGColor:(UIColor *_Nullable)BGColor Frame:(CGRect)Frame BackgroundImage:(UIImage *_Nullable)BackgroundImage InView:(UIView *_Nullable)InView {

    UIView *View = [[UIView alloc] initWithFrame:Frame];

    View.backgroundColor = BGColor;
    
    View.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    
    UIImage *Image = BackgroundImage;
    
    View.layer.contents = (__bridge id _Nullable)(Image.CGImage);
       
    [InView addSubview:View];

    return View;
}


+(UILabel *) InitLabelWithName:(NSString *)Name TextAlignment:(NSTextAlignment)TextAlignment LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *)InView {
    
    float LeftNRight = [UIScreen mainScreen].bounds.size.width;
    float UpAndDown = [UIScreen mainScreen].bounds.size.height;

    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;

    CGRect BFrame = CGRectMake(LeftNRight*LeftRight, UpAndDown*UpDown, width*Width, height*Height);
    
    UILabel *Label = [[UILabel alloc] initWithFrame:BFrame];
    
    Label.text = Name;
    
    Label.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    
    Label.textAlignment = TextAlignment;
    
    [InView addSubview:Label];
    
    return Label;
}


+(UILabel *) InitLabelWithName:(NSString *)Name Frame:(CGRect)frame InView:(UIView *)InView {
    
    
    UILabel *Label = [[UILabel alloc] initWithFrame:frame];
    Label.text = Name;
    
    [InView addSubview:Label];
    
    return Label;
}



+(UILabel *) InitLabelInsideViewWithName:(NSString *)Name TextAlignment:(NSTextAlignment)TextAlignment TextColor:(UIColor *)TextColor LeftRight:(float)LeftRight UpDown:(float)UpDown Width:(float)Width Height:(float)Height InView:(UIView *)InView {
 
    
 
    CGRect LFrame = CGRectMake(InView.frame.size.width*LeftRight, InView.frame.size.height*UpDown, InView.frame.size.width*Width, InView.frame.size.height*Height);

    UILabel *Label = [[UILabel alloc] initWithFrame:LFrame];
    
    Label.text = Name;
    
    Label.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    
    Label.textColor = TextColor;
    
    Label.textAlignment = TextAlignment;
    
    [InView addSubview:Label];
    
    return Label;
}






+(NSString *) GetUDID {
    
   NSString *UDID = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] _deviceInfoForKey:@"UniqueDeviceID"]];
    
    return UDID;
}
 

+(NSString *)SizeOfFile:(NSString *)SizeOfFile {
    
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:SizeOfFile error:nil];
    NSInteger fileSize = [[fileAttributes objectForKey:NSFileSize] integerValue];
    NSString *fileSizeStr = [NSByteCountFormatter stringFromByteCount:fileSize countStyle:NSByteCountFormatterCountStyleFile];
    return fileSizeStr;
}


+(NSString *) SizeOfFolder:(NSString *)sizeOfFolder {
    
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:sizeOfFolder error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];

    NSString *file;
    unsigned long long int folderSize = 0;

    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[sizeOfFolder stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }

    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:folderSize countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}



+(NSArray *) ContentOfDir:(NSString *)ContentOfDir {
    

NSArray *Arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:ContentOfDir error:nil];
    
    return Arr;

}



+(BOOL) PlistPath:(NSString *)PlistPath RemoveObjectForKey:(id)RemoveObjectForKey {
    
    static bool Success;
    NSMutableDictionary *MuD = [[NSMutableDictionary alloc] initWithContentsOfFile:PlistPath];
    [MuD removeObjectForKey:RemoveObjectForKey];
   Success = [MuD writeToFile:PlistPath atomically:YES];
    
    return Success;
}



+(id) BundlePathWithFileOrDir:(NSString *)BundlePathWithFileOrDir {
    
 NSString *path = [[NSBundle mainBundle] bundlePath];
 NSString *RealP = [path stringByAppendingPathComponent:BundlePathWithFileOrDir];
    
    return RealP;
}


+(id) DataPathWithFileOrDir:(NSString *)DataPathWithFileOrDir {
    
    NSString *Go = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),DataPathWithFileOrDir];
   
    return Go;
}


+(void) SendGETtoPHP:(NSString *)SendGETtoPHP {
    
    NSString *url = SendGETtoPHP;
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [req setHTTPMethod:@"GET"];

    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
   
          }]
     
     resume];
    
}


+(BOOL) PlistPath:(NSString *)PlistPath SetValue:(id)SetValue ForKey:(id)ForKey {
    
    static bool Success;
    
    NSMutableDictionary *MutDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:PlistPath];
    [MutDictionary setValue:SetValue forKey:ForKey];
  Success = [MutDictionary writeToFile:PlistPath atomically:YES];

    return Success;
}


+(NSString *) PlistPath:(NSString *)PlistPath ObjectForKey:(id)ObjectForKey {
    
    
    NSMutableDictionary *MutDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:PlistPath];
    NSString *GetValue = [MutDictionary objectForKey:ObjectForKey];
    
    return GetValue;
    
}


 
 

+(id) Generator:(NSUInteger)Num {
    
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
    NSMutableString *Generator = [NSMutableString stringWithCapacity:Num];
    for (NSUInteger i = 0U; i < Num; i++) {
    u_int32_t r = arc4random() % [alphabet length];
    unichar c = [alphabet characterAtIndex:r];
    [Generator appendFormat:@"%C", c];
        
    }
    
    NSString *Crazy = [NSString stringWithFormat:@"%@",Generator];

    return Crazy;
    
}

  



+(BOOL) CreatePlistAtPath:(NSString *)CreatePlistAtPath NameWithoutExtension:(NSString *)NameWithoutExtension {
    
 
    
    
    NSString *PlistPath = CreatePlistAtPath;
    
    NSString *PlistName = [PlistPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",NameWithoutExtension]];

    bool Success = [@{} writeToFile:PlistName atomically: YES];
    
    return Success;
        
    
}

+(BOOL) FileExistsAtPath:(NSString *)FileExistsAtPath {
    
       NSFileManager *FileManager = [NSFileManager defaultManager];
    
       bool Success = [FileManager fileExistsAtPath:FileExistsAtPath];
    
    return Success;
}

+(BOOL) RemoveItemAtPath:(NSString *)RemoveItemAtPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    NSError *error;
    
    bool Success = [FileManager removeItemAtPath:RemoveItemAtPath error:&error];
    
    return Success;
}

+(BOOL) CopyItemAtPath:(NSString *)CopyItemAtPath ToPath:(NSString *)ToPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];

    
    bool Success = [FileManager copyItemAtPath:CopyItemAtPath toPath:ToPath error:nil];
    
    return Success;

}


+(BOOL) MoveItemAtPath:(NSString *)MoveItemAtPath ToPath:(NSString *)ToPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];

    
    bool Success = [FileManager moveItemAtPath:MoveItemAtPath toPath:ToPath error:nil];
    
    return Success;

}

+(BOOL) CreateDirectoryAtPath:(NSString *)CreateDirectoryAtPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    NSError *error;

    
    bool Success = [FileManager createDirectoryAtPath:CreateDirectoryAtPath withIntermediateDirectories:YES attributes:nil error:&error];

    return Success;

}

+(BOOL) CreateFileAtPath:(NSString *)CreateFileAtPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
 
    bool Success = [FileManager createFileAtPath:CreateFileAtPath contents:nil attributes:nil];

    return Success;

}

+(BOOL) DownloadLink:(NSString *)DownloadLink ToPath:(NSString *)ToPath {

      NSString *stringURL = DownloadLink;
      NSURL  *url = [NSURL URLWithString:stringURL];
      NSData *urlData = [NSData dataWithContentsOfURL:url];

    static bool Success;
    
      if (urlData) {

          


          NSString *DownName = [DownloadLink lastPathComponent];
          NSString *Download = [ToPath stringByAppendingPathComponent:DownName];

          NSString  *filePath = [NSString stringWithFormat:@"%@",Download];
          Success = [urlData writeToFile:filePath atomically:YES];

          NSLog(@"%@",filePath);


          
    }

    return Success;

}


+(void) UploadFile:(NSString *)UploadFile PHPLink:(NSString *)PHPLink PHPNameValue:(NSString *)PHPNameValue {

             

        NSString *LastP = [UploadFile lastPathComponent];

        NSData *Data = [[NSData alloc] initWithContentsOfFile:UploadFile];



        NSString *urlString = PHPLink;

        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        request.timeoutInterval = 60;
        request.HTTPShouldHandleCookies = false;


        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];

        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",PHPNameValue,LastP]] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:Data]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];

        [request setHTTPBody:body];


        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {



        }]

        resume];
             
             
             
         
    
 }







@end

