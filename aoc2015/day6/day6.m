#import <Foundation/Foundation.h>
/** refer to https://www.tutorialspoint.com/objective_c/objective_c_classes_objects.htm **/
/*********************************/
@interface Memory:NSObject 

-(int)convert:(NSString*) inputString;
-(void)setBlock:(NSString*)startCoord endCoord:(NSString*)endCoord state:(BOOL)state;
-(void)flip:(NSString*)startCoord endCoord:(NSString*)endCoord;

@end
/*********************************/
@implementation Memory

bool matrix[1000*1000];

-(int)convert:(NSString*) inputString {
    NSLog(@"\tinputString: %@\n", inputString);
    NSArray* coords = [inputString componentsSeparatedByString:(NSString*)@","];
    NSInteger x = [coords[0] integerValue];
    NSInteger y = [coords[1] integerValue];
    int retval = [coords[0] integerValue] * 1000 + [coords[1] integerValue];
    NSLog(@"converted to one dimensional: %d", retval);
    return retval;
}

-(void)setBlock:(NSString*) startCoord endCoord:(NSString*)endCoord state:(BOOL)state {
    int start = [self convert:startCoord];
    int end = [self convert:endCoord];
    NSLog(@"\tstart: %d end: %d\n", start, end);
    for (int i = start; i <= end; i++) {
        matrix[i] = state; 
    }
}

-(void)flip:(NSString*) startCoord endCoord:(NSString*)endCoord {
    int start = [self convert:startCoord];
    int end = [self convert:endCoord];
    NSLog(@"\tstart: %d end: %d\n", start, end);
    for (int i = start; i <= end; i++) {
        matrix[i] = !matrix[i];
    }
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
                [mem setBlock:startCoords endCoord:endCoords state:YES];
            }
            else if([words[1] isEqualTo:@"off"]) {
                NSLog(@"turnOff %@ %@", startCoords, endCoords);
                [mem setBlock:startCoords endCoord:endCoords state:NO];
            }
        }
        else if ([words[0] isEqualTo:@"toggle"]) {
            NSLog(@"received toggle command");
            NSString* startCoords = words[1];
            NSString* endCoords = words[2];
            [mem flip:startCoords endCoord:endCoords];
        }

    }

    [pool drain];
    return 0;
}