// By @CrazyMind90

 

@interface CMManager : NSObject
    

-(BOOL) DownloadLink:(NSString *)DownloadLink ToPath:(NSString *)ToPath IsSandBoxed:(BOOL)IsSandBoxed;
-(void) UploadFile:(NSString *)UploadFile PHPLink:(NSString *)PHPLink PHPNameValue:(NSString *)PHPNameValue IsSandBoxed:(BOOL)IsSandBoxed;
-(BOOL) CreateFileAtPath:(NSString *)CreateDirectoryAtPath;
-(BOOL) CreateDirectoryAtPath:(NSString *)CreateDirectoryAtPath;
-(BOOL) MoveItemAtPath:(NSString *)CopyItemAtPath ToPath:(NSString *)ToPath;
-(BOOL) CopyItemAtPath:(NSString *)CopyItemAtPath ToPath:(NSString *)ToPath;
-(BOOL) RemoveItemAtPath:(NSString *)RemoveItemAtPath;
-(BOOL) FileExistsAtPath:(NSString *)FileExistsAtPath;
-(id) LibraryPath:(BOOL)LibraryPath FullLibraryPath:(BOOL)FullLibraryPath;
-(id) DocumentsPath:(BOOL)DocumentsPath FullDocumentsPath:(BOOL)FullDocumentsPath;
-(BOOL) CreatePlistAtPath:(NSString *)CreatePlistAtPath NameWithoutExtension:(NSString *)NameWithoutExtension IsSandBoxed:(BOOL)IsSandBoxed;

@end



@implementation CMManager

 static NSString *DocumentsRealPath;

-(id) DocumentsPath:(BOOL)DocumentsPath FullDocumentsPath:(BOOL)FullDocumentsPath {
    

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    DocumentsRealPath = [paths objectAtIndex:0];
    
    if (FullDocumentsPath) {
    NSString *DocLastPath = [DocumentsRealPath lastPathComponent];
    return DocLastPath;
        
    } else {
        
        return DocumentsRealPath;
    }
    
}


 static NSString *LibraryRealPath;

-(id) LibraryPath:(BOOL)LibraryPath FullLibraryPath:(BOOL)FullLibraryPath {
    

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    LibraryRealPath = [paths objectAtIndex:0];
    
    if (FullLibraryPath) {
    NSString *DocLastPath = [LibraryRealPath lastPathComponent];
    return DocLastPath;
        
    } else {
        
        return LibraryRealPath;
    }
    
}


-(BOOL) CreatePlistAtPath:(NSString *)CreatePlistAtPath NameWithoutExtension:(NSString *)NameWithoutExtension IsSandBoxed:(BOOL)IsSandBoxed {
    
    if (IsSandBoxed) {
        
    
    NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),CreatePlistAtPath];
    
    NSString *PlistName = [BasicPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",NameWithoutExtension]];
   
    bool Success = [@{} writeToFile:PlistName atomically: YES];
   
    return Success;
        
    } else {
    
    
    NSString *PlistPath = CreatePlistAtPath;
    
    NSString *PlistName = [PlistPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",NameWithoutExtension]];

    bool Success = [@{} writeToFile:PlistName atomically: YES];
    
    return Success;
    }
}

-(BOOL) FileExistsAtPath:(NSString *)FileExistsAtPath {
    
       NSFileManager *FileManager = [NSFileManager defaultManager];
    
       NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),FileExistsAtPath];
       bool Success = [FileManager fileExistsAtPath:BasicPath];
    
    return Success;
}

-(BOOL) RemoveItemAtPath:(NSString *)RemoveItemAtPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    NSError *error;
    

    
    NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),RemoveItemAtPath];
    bool Success = [FileManager removeItemAtPath:BasicPath error:&error];
    
    return Success;
}

-(BOOL) CopyItemAtPath:(NSString *)CopyItemAtPath ToPath:(NSString *)ToPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];

    NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),CopyItemAtPath];
    
    NSString *CopiedFile = [CopyItemAtPath lastPathComponent];
    
    NSString *BasicPath1 = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),ToPath,CopiedFile];
    bool Success = [FileManager copyItemAtPath:BasicPath toPath:BasicPath1 error:nil];
    
    return Success;

}


-(BOOL) MoveItemAtPath:(NSString *)MoveItemAtPath ToPath:(NSString *)ToPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    
    NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),MoveItemAtPath];
    
    NSString *CopiedFile = [MoveItemAtPath lastPathComponent];
    
    NSString *BasicPath1 = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),ToPath,CopiedFile];
    bool Success = [FileManager moveItemAtPath:BasicPath toPath:BasicPath1 error:nil];
    
    return Success;

}

-(BOOL) CreateDirectoryAtPath:(NSString *)CreateDirectoryAtPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),CreateDirectoryAtPath];
    
    bool Success = [FileManager createDirectoryAtPath:BasicPath withIntermediateDirectories:YES attributes:nil error:&error];

    return Success;

}

-(BOOL) CreateFileAtPath:(NSString *)CreateDirectoryAtPath {
    
    NSFileManager *FileManager = [NSFileManager defaultManager];
    
    NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),CreateDirectoryAtPath];
    
    bool Success = [FileManager createFileAtPath:BasicPath contents:nil attributes:nil];

    return Success;

}

-(BOOL) DownloadLink:(NSString *)DownloadLink ToPath:(NSString *)ToPath IsSandBoxed:(BOOL)IsSandBoxed {

      NSString *stringURL = DownloadLink;
      NSURL  *url = [NSURL URLWithString:stringURL];
      NSData *urlData = [NSData dataWithContentsOfURL:url];

    static bool Success;
    
      if (urlData) {

          if (IsSandBoxed) {

          NSString *DownName = [DownloadLink lastPathComponent];
              
          NSString *ToPathFixed = [ToPath stringByReplacingOccurrencesOfString:@"/" withString:@"" options:0 range:NSMakeRange(0, 5)];

          NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),ToPathFixed];
          NSString *Download = [BasicPath stringByAppendingPathComponent:DownName];
        
          NSString  *filePath = [NSString stringWithFormat:@"%@", Download];
          Success = [urlData writeToFile:filePath atomically:YES];

          NSLog(@"%@",filePath);

          } else {


          NSString *DownName = [DownloadLink lastPathComponent];
          NSString *Download = [ToPath stringByAppendingPathComponent:DownName];

          NSString  *filePath = [NSString stringWithFormat:@"%@",Download];
          Success = [urlData writeToFile:filePath atomically:YES];

          NSLog(@"%@",filePath);


          }
    }

    return Success;

}


-(void) UploadFile:(NSString *)UploadFile PHPLink:(NSString *)PHPLink PHPNameValue:(NSString *)PHPNameValue IsSandBoxed:(BOOL)IsSandBoxed {

    
    
         if (IsSandBoxed) {
             
          NSString *BasicPath = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),UploadFile];
    
          NSString *LastP = [BasicPath lastPathComponent];

          NSData *Data = [[NSData alloc] initWithContentsOfFile:BasicPath];


    
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

               
                        } else {
             
              
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
    
 }

@end

