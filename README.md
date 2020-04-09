# CMManager

I coded this header to make NSFileManager easy to use on SandBoxed applications for me .. But you are free to use it 

Most functions works on sandboxed application 


### Import 

```objective-c
#import "CMManager.h"
```


### How To Use

```objective-c
CMManager *CrazyMind [[CMManager alloc] init];
```

### Download

```objective-c
 [CrazyMind DownloadLink:@"https:/..../CM909.png" ToPath:@"Documents" IsSandBoxed:YES];
 
 OR 
 
 [CrazyMind DownloadLink:@"https:/..../CM909.png" ToPath:@"/var/mobile" IsSandBoxed:NO];
```



### Upload 

```objective-c
[CrazyMind UploadFile:@"Documents/CM909.png.zip" PHPLink:@"https://Crazy/PP.php" PHPNameValue:@"upload" IsSandBoxed:YES];
```




### You Can Create, Copy, Move, Remove and Check If File Exist ..



### Copy OR Move

```objective-c
[CrazyMind CopyItemAtPath:@"Library/Preferences" ToPath:@""]; // To Copy "Preferences" To HomeDirectory

//OR
[CrazyMind CopyItemAtPath:@"Library/Preferences" ToPath:[CM DocumentsPath:YES FullDocumentsPath:YES]]; To Copy "Preferences" To DocumentsDirectory
```



### Create

```objective-c
[CrazyMind CreateFileAtPath:@"Library/HolaLibrary"];
```



### Remove

```objective-c
[CrazyMind RemoveItemAtPath:@"Library/CM90.png"];
```



### FileExistsAtPath

```objective-c
if ([CrazyMind FileExistsAtPath:@"Hi.zip"]) {

        NSLog(@"Found");
        
    } else {
        
        NSLog(@"Not Found");
        
    }
```
















