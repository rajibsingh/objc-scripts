#import <Foundation/Foundation.h>

@interface Address:NSObject
- (void)sampleMethod;
@end

@implementation Address

- (void)sampleMethod {
    NSLog(@"Hello, World! \n");
}

@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSMutableSet *addresses = [NSMutableSet setWithCapacity:10];


    [pool drain];
    return 0;
}