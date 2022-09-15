#import <Foundation/Foundation.h>

/*********************************/
@interface Circuitboard:NSObject 

    -(Circuitboard*)init;
    -(void)addToDict:(NSString*)key value:(NSInteger)value;
    -(NSInteger)getRegister:(NSString*)name;
    -(BOOL)isNumeric:(NSString*)key;
    -(void)shiftOp:(NSString*)src shifts:(NSInteger)shifts dest:(NSString*)dest
        direction:(NSString*)direction;
    -(void)andOrOp:(NSString*)src1 src2:(NSString*)src2 dest:(NSString*)dest op:(NSString*)op;
    -(void)sendSignal:(NSString*)src dest:(NSString*)dest invert:(bool)invert;
    -(void)print;
    -(NSNumber*)disambiguateValue:(NSString*)src;

@end

/**********************************/
@interface Input:NSObject
    -(Input*) init;
    -(NSString*) getOp;
    -(NSMutableArray*)getInputs;
@end

/*********************************/
@implementation Input
    -(Input*) init {
        return self;
    }

    -(NSString*) getOp {
        return @"not implemented yet";
    }

    -(NSMutableArray*) getInputs {
        return [[NSMutableArray alloc] init];
    }


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

-(void)shiftOp:(NSString*)src shifts:(NSInteger)shifts dest:(NSString*)dest
        direction:(NSString*)direction {
    NSLog(@"running SHIFT case: src: %@, shifts: %ld, dest: %@, direction: %@",
         src, shifts, dest, direction);
    NSNumber* val;
    //check if numeric or a reference to a location
    val = [self disambiguateValue:src];

    NSInteger retVal = 0;
    if ([direction isEqualToString:@"RSHIFT"]) {
        retVal = [val integerValue] >> shifts;
    } else if ([direction isEqualToString:@"LSHIFT"]) {
        retVal = [val integerValue] << shifts;
    }

    NSLog(@"retVal: %ld", retVal);
    [self addToDict:dest value:retVal];
}

-(void)andOrOp:(NSString*)src1 src2:(NSString*)src2 dest:(NSString*)dest
        op:(NSString*)op{
    NSLog(@"running andOrOp case: src1: %@ src2: %@ dest: %@ op:%@", src1, src2, dest, op);
    NSNumber* src1Val = [self disambiguateValue:src1];
    NSNumber*src2Val = [self disambiguateValue:src2];
    NSInteger retVal;
    if ([op isEqualToString:@"AND"]) {
        retVal = [src1Val integerValue] & [src2Val integerValue];
    } else if ([op isEqualToString:@"OR"]) {
        retVal = [src1Val integerValue] | [src2Val integerValue];
    }
    NSLog(@"retVal: %ld", retVal);
    [self addToDict:dest value:retVal];
}

-(void)sendSignal:(NSString*)src dest:(NSString*)dest invert:(bool)invert{
    NSLog(@"running the sendSignal case: src: %@ dest: %@", src, dest);
    NSNumber* srcVal = [self disambiguateValue:src];
    NSInteger retVal;
    if (invert) {
        uint16_t retVal = ~([srcVal unsignedIntValue]);
        NSLog(@"retVal: %hu", retVal);
        [self addToDict:dest value:retVal];
    } else {
        [self addToDict:dest value:[srcVal integerValue]];
    }
}

-(NSNumber*)disambiguateValue:(NSString*)src {
    NSNumber* val;
    //check if numeric or a reference to a location
    if (![self isNumeric:src]) {
        val = [board objectForKey:src];
    } else {
        val = [NSNumber numberWithInt:[src integerValue]];
    }
    NSLog(@"disambiguated %@ --> %@", src, val);
    return val;
}

-(void)print {
    NSLog(@"board: %@", board);
}

-(BOOL)isNumeric:(NSString*)str {
    NSUInteger len = [str length];
    for (int i = 0; i < len; i++) {
        unichar ch = [str characterAtIndex:i];
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

        if ([line length] == 0) {
            NSLog(@"empty line!");
        }
        else if ([line containsString:@"SHIFT"]) {
            NSString* direction = words[1];
            NSString* src = words[0];
            int shiftAmount = [words[2] integerValue];
            NSString* dest = words[4];
            [circuitboard shiftOp:src shifts:shiftAmount dest:dest direction:direction];
        }
        else if ([line containsString:@"AND"] || [line containsString:@"OR"]) {
            NSString* src1 = words[0];
            NSString* src2 = words[2];
            NSString* dest = words[4];
            NSString* opName = words[1];
            [circuitboard andOrOp:src1 src2:src2 dest:dest op:opName];
        } else if ([line containsString:@"NOT"]) {
            NSLog(@"running NOT operation");
            NSString* src = words[1];
            NSString* dest = words[3];
            [circuitboard sendSignal:src dest:dest invert:YES];
        } else {
            NSLog(@"sending signal");
            NSString* src = words[0];
            NSString* dest = words[2];
            [circuitboard sendSignal:src dest:dest invert:NO];
        }
    }
    [circuitboard print];

    [pool drain];
    return 0;
}