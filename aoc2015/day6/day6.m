#import <Foundation/Foundation.h>
/*********************************/
@interface Memory:NSObject 

    -(void)turnOn;

@end
/*********************************/
@implementation Memory

bool matrix[1000*1000];

-(void)turnOn {
    NSLog(@"hhh");
}

@end
/*********************************/

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    for (NSString* line in lines) {
        NSLog(@"*** line: %@", line);
        NSArray* words = [line componentsSeparatedByString:(NSString *)@" "];
        if ([words[0] isEqualTo:@"turn"]) {
            if([words[1] isEqualTo:@"on"]) {
                NSLog(@"received turnOn command");
            }
            if([words[1] isEqualTo:@"off"]) {
                NSLog(@"received turnOff command");
            }
        }
        else if ([words[0] isEqualTo:@"toggle"]) {
            NSLog(@"received toggle command");
        }
    }
    Memory *mem = [[Memory alloc] init];

    [pool drain];
    return 0;
}