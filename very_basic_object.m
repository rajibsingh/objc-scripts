#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
- (void)sampleMethod;
@end

@implementation SampleClass

- (void)sampleMethod {
    NSLog(@"Hello, World! \n");
}

@end

int main() {
    SampleClass *sampleClass = [[SampleClass alloc]init];
    [sampleClass sampleMethod];
    NSString *resDir = [[NSBundle mainBundle] resourcePath];
    printf("%s", resDir);
    return 0;
}