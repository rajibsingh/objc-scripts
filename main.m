#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
- (void)sampleMethod:(NSString*) name: (NSString*) greeting;
@end

@implementation SampleClass
- (void)sampleMethod:(NSString*) name: (NSString*) greeting {
    NSLog(@"%@ %@\n", name, greeting);
    printf("%s\n",str);
}
@end

int main() {
    /* my first program in Objective-C */
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    SampleClass *sampleClass = [[SampleClass alloc]init];
    [sampleClass sampleMethod:@"Raj": greeting:@"Hola"];
    // greeter(5);
    // status = "second status";
    // printf("%s", status);
    // read a file - https://stackoverflow.com/a/4466934/1922101
    // NSString* filePath = @"/Users/raj/junk.txt";
    // NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            // encoding:NSUTF8StringEncoding error:nil];
    // NSLog(fileContent);
    [pool drain];
    return 0;
}