#import <Foundation/Foundation.h>

@interface GridAddress:NSObject
- (void)sampleMethod;
@end

@implementation GridAddress

- (void)sampleMethod {
    NSLog(@"Hello, World! \n");
}

@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSMutableSet<GridAddress> *addresses = [NSMutableSet setWithCapacity:10];
    int x = 0;
    int y = 0;
    for (NSInteger i = 0; i < fileContent.length ; i++) {
        unichar idx = [fileContent characterAtIndex:i];
        // NSLog(@"%c",idx);
        switch(idx){
            case '^':
                y += 1;
                break;
            case 'v':
                y -= 1;
                break;
            case '<':
                x -= 1;
                break;
            case '>':
                x += 1;
                break;
        }
        // NSLog(@"%d, %d", x, y);
        GridAddress * address = [[GridAddress alloc] init];
        [addresses addObject:address];
     }

    [pool drain];
    return 0;
}