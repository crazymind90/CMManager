# CMManager

I coded this header to make things easier for me .. But you are free to use it 


### Import 

```objective-c
#import "CMManager.h"
```


### How To Use

```objective-c
[CMManager ......];
```
 
 
 ### PlayAudioFromURL

```objective-c
    
[CMManager PlayAudioFromURL:@"https://...../Audio.mp3"];
```


### PlayAudioFromPath

```objective-c

[CMManager PlayAudioAtPath:@"/var/mobile/Audio.mp3"];
```

 
 
 
 ### PlayVideoFromPath

```objective-c

 [CMManager PlayVideoAtPath:[NSURL fileURLWithPath:@"/var/mobile/Video.mp4"] InViewController:self];
```





### ShareFile,VideoOrPicOverAirDropAndOtherOptionsUsing "UIActivityViewController"

```objective-c

[CMManager ShareItemAtPath:@"/var/mobile/myfile.zip" InViewController:self];
```



### AddNewOptionsBesideCopyAndPasteUsing "UIMenuController"

```objective-c

- (void)viewDidLoad {
    [super viewDidLoad];
    
[CMManager AddNewItemWithTitle:@"CustomCopy" InView:self.view Action:@selector(Action)];

   }
   
   
-(void) Action {

  NSLog(@"CustomCopy Pressed");
}
    
```

### ActivateTheFollowingCodeAfter "Timer"
```objective-c

    [CMManager ActivateTheFollowingCodeAfter:2.4 handler:^{
       
        NSLog(@"Will print after 2.4 seconds");
        
    }];
    
```


### Dispatch
```objective-c

    [CMManager StartDispatch:^{
        
        
    } EndDispath:^{
        
        
    }];
    
```


### CopyAndPaste
```objective-c

    [CMManager CopyToClipboard:@"I'm @CrazyMind90"];
    NSString *Get = [CMManager PasteFromClipboard];
    
    NSLog(@"%@",Get); // Will print "I'm @CrazyMind90"
    
```



### Download

```objective-c
// For example , you wanna download a picture to Library path 

   NSString *LibraryPath = [CMManager DataPathWithFileOrDir:@"Library"];
    
    [CMManager DownloadLink:@"https://.....png" ToPath:LibraryPath];
```



### Upload 
```objective-c
[CMManager UploadFile:@"Documents/CM909.png.zip" PHPLink:@"https://Crazy/PP.php" PHPNameValue:@"upload"];
```

### CustomUIAlertController

```objective-c
[CMManager InitAlertWithTitle:@"JDTitle" TitleColor:UIColorFromHEX(0x128890) Message:@"Cmessage" MessageColor:UIColor.greenColor Buttons:@[@"Button1",@"Button2",@"Button3"] ButtonsColor:UIColor.whiteColor ButtonsImage:[UIImage imageNamed:@"sys"] BackgroundColor:UIColorFromHEX(0x303030) AlertStyle:UIAlertControllerStyleAlert Target:self handler:^(NSString * _Nullable ButtonTitle) {
       
        if ([ButtonTitle isEqual:@"Button1"])
        NSLog(@"Button1 it is");
        
        if ([ButtonTitle isEqual:@"Button2"])
        NSLog(@"Button2 it is");
        
        if ([ButtonTitle isEqual:@"Button3"])
        NSLog(@"Button3 it is");
           
    }];
    
```


### Initialize a new button 

```objective-c

UIButton *Button;
Button = [CMManager InitButtonWithName:@"Button" LeftRight:0.34 UpDown:0.33 Width:0.30 Height:0.07 InView:self.view Target:self Action:@selector(Action:)];
Button.layer.cornerRadius = 20;
Button.layer.backgroundColor = UIColor.darkGrayColor.CGColor;
```


### Initialize a new switch 

```objective-c

- (void)viewDidLoad {

 [CMManager InitSwitchInsideViewWithAction:@selector(SwitchState) LeftRight:0.48 UpDown:0.40 Width:1.1 Height:1.2 InView:self.view Target:self];
 
 }
 
-(void) SwitchState {
    
    if (!state) {
    
            NSLog(@"ON");
    
            state = YES;
    
        } else {
    
    
            NSLog(@"OFF");
    
            state = NO;
        }
}

```


### Initialize a new and blured image  

```objective-c

 [CMManager InitImage:[CMManager BlureImage:[UIImage imageNamed:@"/path/to/image.png"] BlureLevel:94.0f] LeftRight:0.1 UpDown:0.1 Width:0.1 Height:0.1 InView:self.view];

```


### Initialize UINavigationBar  

```objective-c

[CMManager InitNavigationBarWithTitle:NaviTitle Frame:CGRectMake(0, 36, self.view.frame.size.width, 45) Style:UIBarStyleBlack LeftButton:UIBarButtonSystemItemCancel LeftButtonAction:@selector(CancelButton) RightButton:UIBarButtonSystemItemDone RightButtonAction:@selector(DoneButton) InView:self.view Target:self];


```


### Initialize a new label  

```objective-c

UILabel *Label;
Label = [CMManager InitLabelWithName:@"Label" TextAlignment:NSTextAlignmentCenter LeftRight:0.34 UpDown:0.22 Width:0.30 Height:0.07 InView:self.view];
Label.layer.cornerRadius = 20;
Label.layer.backgroundColor = UIColor.cyanColor.CGColor;
```


### Initialize a new view 

```objective-c

UIView *View;
View = [CMManager InitViewWithBGColor:UIColorFromHEX(0x353535) LeftRight:22.7 UpDown:19.5 Width:1.1 Height:9 BackgroundImage:[CMManager BlureImage:[UIImage imageNamed:@"/path/to/image.png"] BlureLevel:94.0] InView:self.view];
View.layer.cornerRadius = 20;
```


### Initialize a new button inside the second view 

```objective-c

UIButton *InsButton = [CMManager InitButtonInsideViewWithName:@"Button1" LeftRight:55 UpDown:11.5 Width:0.45 Height:0.30 InView:View Target:self Action:@selector(BInside:)];
InsButton.backgroundColor = UIColor.grayColor;
InsButton.layer.cornerRadius = 20;
```




### You Can Create@[File,Directory,Plist], Copy, Move, Remove and Check If File Exist ..



### Create Plist

```objective-c
 [CMManager CreatePlistAtPath:@"/var/mobile/Documents" NameWithoutExtension:@"MyPlist"];
```



### Set a new value to Plist , Get Value and Remove key

```objective-c
// Set a new value
     NSString *PlistPath = @"/var/mobile/Documents/MyPlist.plist";
    
    [CMManager PlistPath:PlistPath SetValue:@"Hola" ForKey:@"abcd"];
   
// Get Value
   NSString *GetHolaValue = [CMManager PlistPath:PlistPath ObjectForKey:@"abcd"];
    NSLog(@"GetHolaValue = %@",GetHolaValue); // It will print "Hola"
    
    
// Remove key
    [CMManager PlistPath:PlistPath RemoveObjectForKey:@"abcd"]; // It will remove Hola
```



### And other usefull functions ,













 






