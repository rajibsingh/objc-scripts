#import <Foundation/Foundation.h>


/*********************************/
@interface Circuitboard:NSObject 

-(Circuitboard*)init;
-(void)addToDict:(NSString*)key value:(NSString*)value;
-(void)print;

@end
/*********************************/
@implementation Circuitboard 

NSMutableDictionary *board;

-(Circuitboard*)init {
    if (self = [super init]) {
        board =  [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    return self;
}

-(void)addToDict:(NSString*)key value:(NSString*)value {
    [board setObject:value forKey:key];
}

-(void)print {
    NSLog(@"board: %@", board);
}

@end
/*********************************/

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    Circuitboard *circuitboard = [[Circuitboard alloc] init];
    for (NSString* line in lines) {
        NSLog(@"*** line: %@", line);
        NSArray* words = [line componentsSeparatedByString:(NSString *)@" "];
        [circuitboard addToDict:words[0] value:words[1]];
        
        // if ([words[0] isEqualTo:@"turn"]) {
            // NSString* startCoords = words[2];
            // NSString* endCoords = words[4];
            // if([words[1] isEqualTo:@"on"]) {
                // NSLog(@"turnOn %@ %@", startCoords, endCoords);
                // [mem setBlock:startCoords endCoord:endCoords state:YES];
            // }
            // else if([words[1] isEqualTo:@"off"]) {
                // NSLog(@"turnOff %@ %@", startCoords, endCoords);
                // [mem setBlock:startCoords endCoord:endCoords state:NO];
            // }
        // }
        // else if ([words[0] isEqualTo:@"toggle"]) {
            // NSLog(@"received toggle command");
            // NSString* startCoords = words[1];
            // NSString* endCoords = words[3];
            // [mem flip:startCoords endCoord:endCoords];
        // }

    }
    [circuitboard print];

    [pool drain];
    return 0;
}