#import <Foundation/Foundation.h>

/*********************************/
@interface Circuitboard:NSObject 

-(Circuitboard*)init;
-(void)addToDict:(NSString*)key value:(NSInteger)value;
-(NSInteger)getRegister:(NSString*)name;
-(BOOL)isNumeric:(NSString*)key;
-(void)rshift:(NSString*)src shifts:(NSInteger)shifts;
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

-(void)addToDict:(NSString*)key value:(NSInteger)value {
    NSNumber* valObj= [NSNumber numberWithInt:value];
    [board setObject:valObj forKey:key];
}

-(NSInteger)getRegister:(NSString*)name {
    NSNumber* retVal = board[name];
    return [retVal integerValue];
}

-(void)rshift:(NSString*)src shifts:(NSInteger)shifts {

}

-(void)print {
    NSLog(@"board: %@", board);
}

-(BOOL)isNumeric:(NSString*)str {
    NSLog(@"testing: %@", str);
    NSUInteger len = [str length];
    for (int i = 0; i < len; i++) {
        unichar ch = [str characterAtIndex:i];
        NSLog(@"testing %C", ch);
        switch(ch) {
            case '0':
                break;
            case '1':
                break;
            case '2':
                break;
            case '3':
                break;
            case '4':
                break;
            case '5':
                break;
            case '6':
                break;
            case '7':
                break;
            case '8':
                break;
            case '9':
                break;
            default:
                return NO;
        }
    }
    return YES;
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
        if ([words[0] isEqualTo:@"NOT"]) {
            NSLog(@"running NOT case");
        } else if ([circuitboard isNumeric:words[0]]) {
            NSLog(@"running numeric case");
        } else {
            NSLog(@"running the default case");
        }
        
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