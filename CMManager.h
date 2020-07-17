// By @CrazyMind90


#import <UIKit/UIKit.h>


@interface CMManager : NSObject

 

+(BOOL) DownloadLink:(NSString *)DownloadLink ToPath:(NSString *)ToPath;

+(void) UploadFile:(NSString *)UploadFile PHPLink:(NSString *)PHPLink PHPNameValue:(NSString *)PHPNameValue;

+(BOOL) CreateFileAtPath:(NSString *)CreateDirectoryAtPath;

+(BOOL) CreateDirectoryAtPath:(NSString *)CreateDirectoryAtPath;

+(BOOL) MoveItemAtPath:(NSString *)CopyItemAtPath ToPath:(NSString *)ToPath;

+(BOOL) CopyItemAtPath:(NSString *)CopyItemAtPath ToPath:(NSString *)ToPath;

+(BOOL) RemoveItemAtPath:(NSString *)RemoveItemAtPath;

+(BOOL) FileExistsAtPath:(NSString *)FileExistsAtPath;

+(BOOL) CreatePlistAtPath:(NSString *)CreatePlistAtPath NameWithoutExtension:(NSString *)NameWithoutExtension;

+(id) Generator:(NSUInteger)Num;

+(NSString *) PlistPath:(NSString *)PlistPath ObjectForKey:(NSString *)ObjectForKey;

+(BOOL) PlistPath:(NSString *)PlistPath SetValue:(id)SetValue ForKey:(id)ForKey;

+(void) SendGETtoPHP:(NSString *)SendGETtoPHP;

+(id) DataPathWithFileOrDir:(NSString *)DataPathWithFileOrDir;

+(id) BundlePathWithFileOrDir:(NSString *)BundlePathWithFileOrDir;

+(BOOL) PlistPath:(NSString *)PlistPath RemoveObjectForKey:(id)RemoveObjectForKey;

+(NSArray *) ContentOfDir:(NSString *)ContentOfDir;

+(NSString *) SizeOfFolder:(NSString *)sizeOfFolder;

+(NSString *)SizeOfFile:(NSString *)SizeOfFile;

+(NSString *) GetUDID;

@end

 
