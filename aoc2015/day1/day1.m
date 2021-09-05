#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%s", fileContent);
    NSUInteger length = [fileContent length];
    NSLog(@"length: %lu", length);
    int counter = 0;
    for (NSInteger i = 0; i < fileContent.length ; i++) {
        unichar x = [fileContent characterAtIndex:i];
        // NSLog(@"%C ", x);
        // NSLog(@"%s ", leftParen);
        if (x == '(')
            counter++;
        else if (x == ')')
            counter--;
    }
    NSLog(@"%d ", counter);
    [pool drain];
    return 0;
}