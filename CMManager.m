// By @CrazyMind90

 
#import "CMManager.h"


@interface UIDevice ()

-(id)_deviceInfoForKey:(NSString *)key;

@end




@implementation CMManager

 

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

