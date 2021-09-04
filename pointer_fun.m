#import <Foundation/Foundation.h>



int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    int x = 666;
    int y = 666;
    printf("x is %d\n", x);
    int *address = &x;
    printf("x lives at %p\n", address);
    printf("y lives at %p\n", &y);
    printf("main is at %p\n", main);
    printf("size of x is %d\n", sizeof(x));
    printf("size of main is %d\n", sizeof(main));
    *address = 999;
    printf("x is %d\n", x);
    printf("x lives at %p\n", address);
    [pool drain];
    return 0;
}