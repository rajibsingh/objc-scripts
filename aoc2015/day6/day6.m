#import <Foundation/Foundation.h>
/** refer to https://www.tutorialspoint.com/objective_c/objective_c_classes_objects.htm **/
/*********************************/
@interface Memory:NSObject 

-(void)turnOn:(NSString*) startCoord endCoord:(NSString*)endCoord;

@end
/*********************************/
@implementation Memory

bool matrix[1000*1000];

-(void)turnOn:(NSString*) startCoord endCoord:(NSString*)endCoord {
    NSLog(@"\tstartCoord: %@\n", startCoord);
    NSLog(@"\tendCoord: %@\n", endCoord);
}

-(void)convertCoords:(NSString*) coord {
    NSLog(@"\tconvert coord: %@\n", coord);
}

@end
/*********************************/

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    Memory *mem = [[Memory alloc] init];
    for (NSString* line in lines) {
        NSLog(@"*** line: %@", line);
        NSArray* words = [line componentsSeparatedByString:(NSString *)@" "];
        if ([words[0] isEqualTo:@"turn"]) {
            NSString* startCoords = words[2];
            NSString* endCoords = words[4];
            if([words[1] isEqualTo:@"on"]) {
                NSLog(@"turnOn %@ %@", startCoords, endCoords);
            }
            else if([words[1] isEqualTo:@"off"]) {
                NSLog(@"turnOn %@ %@", startCoords, endCoords);
            }
        }
        else if ([words[0] isEqualTo:@"toggle"]) {
            NSLog(@"received toggle command");
        }
    }

    [pool drain];
    return 0;
}