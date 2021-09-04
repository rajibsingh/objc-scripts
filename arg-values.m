#import <Foundation/Foundation.h>

int main(int argc, char *argv[] ) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"argc: %d", argc);
    for (int i = 0; i < argc; i++) {
        NSLog(@"%d argv val:%s",i,argv[i]);
    }
    [pool drain];
    return 0;
}