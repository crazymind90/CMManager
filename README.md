# CMManager

I coded this header to make NSFileManager easy to use on SandBoxed applications for me .. But you are free to use it 

Most functions works on sandboxed application 


### Import 

```objective-c
#import "CMManager.h"
```


### How To Use

```objective-c
[CMManager ......];
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

















### Note
### If you want to be a developer fastly - Clone any Github project , write your name , Boom , You are officially a developer 

```objective-c
 [CrazyMind Clone:@"https://github.com/anyProject"];
```










