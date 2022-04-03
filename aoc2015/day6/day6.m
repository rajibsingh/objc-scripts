#import <Foundation/Foundation.h>
/** refer to https://www.tutorialspoint.com/objective_c/objective_c_classes_objects.htm **/

typedef struct {
    NSUInteger x;
    NSUInteger y;
} MemPoint;


/*********************************/
@interface Memory:NSObject 

-(MemPoint)convert:(NSString*) inputString;
-(void)setBlock:(NSString*)startCoord endCoord:(NSString*)endCoord state:(BOOL)state;
-(void)flip:(NSString*)startCoord endCoord:(NSString*)endCoord;
-(int)count;

@end
/*********************************/
@implementation Memory

bool matrix[1000][1000];

-(MemPoint)convert:(NSString*) inputString {
    NSLog(@"\tinputString: %@\n", inputString);
    NSArray* coords = [inputString componentsSeparatedByString:(NSString*)@","];
    NSUInteger x = [coords[0] integerValue];
    NSUInteger y = [coords[1] integerValue];
    MemPoint retVal = { x, y };
    return retVal;
}

-(void)setBlock:(NSString*) startCoord endCoord:(NSString*)endCoord state:(BOOL)state {
    MemPoint start = [self convert:startCoord];
    MemPoint end = [self convert:endCoord];
    // NSLog(@"\tstart.x: %lu start.y %lu \tend.x: %lu end.y: %lu\n", 
        // start.x, start.y, end.x, end.y);
    for (int i = start.y; i <= end.y; i++) {
        for (int j = start.x; j <= end.y; j++) {
            matrix[i][j] = state; 
        }
    }
}

-(void)flip:(NSString*) startCoord endCoord:(NSString*)endCoord {
    MemPoint start = [self convert:startCoord];
    MemPoint end = [self convert:endCoord];
    // NSLog(@"\tstart.x: %lu start.y %lu \tend.x: %lu end.y: %lu\n", 
        // start.x, start.y, end.x, end.y);
    for (int i = start.y; i <= end.y; i++) {
        for (int j = start.x; j <= end.y; j++) {
            matrix[i][j] = !matrix[i][j]; 
        }
    }
}

-(int)count {
    int count = 0;
    for (int i=0; i < 1000; i++) {
        for (int j=0; j<1000; j++) {
            if (matrix[i][j] == YES) 
                count++;
        }
    }
    return count;
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
            NSString* endCoords = words[3];
            [mem flip:startCoords endCoord:endCoords];
        }

    }
    int count = [mem count];
    NSLog(@"count %d", count);


    [pool drain];
    return 0;
}