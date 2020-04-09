# CMManager

I coded this header to make NSFileManager easy to use on SandBoxed applications for me .. But you are free to use it 

Most functions works on sandboxed application 


### Import 

```
#import "CMManager.h"
```


### How To Use

```
CMManager *CrazyMind [[CMManager alloc] init];
```

### Download

```
 [CrazyMind DownloadLink:@"https:/..../CM909.png" ToPath:@"Documents" IsSandBoxed:YES];
```



### Upload 

```
[CrazyMind UploadFile:@"Documents/CM909.png.zip" PHPLink:@"https://Crazy/PP.php" PHPNameValue:@"upload" IsSandBoxed:YES];
```



You Can Create, Copy, Move And Remove ..

### Copy OR Move

```
[CrazyMind CopyItemAtPath:@"Library/Preferences" ToPath:@""]; // To Copy "Preferences" To HomeDirectory

//OR
[CrazyMind CopyItemAtPath:@"Library/Preferences" ToPath:[CM DocumentsPath:YES FullDocumentsPath:YES]]; To Copy "Preferences" To DocumentsDirectory
```



### Create

```
[CrazyMind CreateFileAtPath:@"Library/HolaLibrary"];
```



### Remove

```
[CrazyMind RemoveItemAtPath:@"Library/CM90.png"];
```



### FileExistsAtPath

```
if ([CM FileExistsAtPath:@"Hi.zip"]) {

        NSLog(@"Found");
        
    } else {
        
        NSLog(@"Not Found");
        
    }
```
















