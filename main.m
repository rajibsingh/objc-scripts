#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
- (void)sampleMethod;
@end

@implementation SampleClass

- (void)sampleMethod {
    NSLog(@"Hello, World! \n");
    char *str = "new string";
    printf("%s\n",str);
}

@end

void greeter(int val)
{
    if (val == 0) {
        printf("stop\n");
        return;
    } else {
        printf("greetings %d\n", val);
        greeter(val-1);
    }
    printf("recycling %d\n", val);
}

char *status = "first status";

int main() {
    /* my first program in Objective-C */
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    SampleClass *sampleClass = [[SampleClass alloc]init];
    [sampleClass sampleMethod];
    // greeter(5);
    // status = "second status";
    // printf("%s", status);
    // read a file - https://stackoverflow.com/a/4466934/1922101
    NSString* filePath = @"/Users/raj/junk.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            encoding:NSUTF8StringEncoding error:nil];
    NSLog(fileContent);
    [pool drain];
    return 0;
}