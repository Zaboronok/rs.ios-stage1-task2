#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    if ([minutes intValue] > 60) {
        return @"";
    }
    
    NSString *half = @"half";
    NSString *past = @"past";
    NSString *quarter = @"quarter";
    NSString *minutesText = @"minutes";
    NSString *oclock = @"o'clock";
    NSString *to = @"to";
    
    NSDictionary *arrOfNumber = @{@"1" : @"one", @"2" : @"two", @"3" : @"three", @"4" : @"four", @"5" : @"five", @"6" : @"six", @"7" : @"seven", @"8" : @"eight", @"9" : @"nine", @"11" : @"eleven", @"12" : @"twelve", @"13" : @"thirteen", @"14" : @"fourteen", @"15" : @"fiveteen", @"16" : @"sixteen", @"17" : @"seventeen", @"18" : @"eighteen", @"19" : @"nineteen", @"10" : @"ten", @"20" : @"twenty", @"30" : @"thirty", @"40" : @"fourty", @"50" : @"fivety" };
    
    NSString *increase = [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", [hours integerValue] + 1]];
    NSString *hour = [arrOfNumber objectForKey:hours];
    
    if ([[minutes substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        minutes = [minutes substringWithRange:NSMakeRange(1, 1)];
    }
    
    NSString *timeWord = [arrOfNumber objectForKey:minutes];
    NSString *minutesMin = [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", 60 - [minutes integerValue]]];
    NSInteger leftMin = 60 - [minutes integerValue];
    
    if ([minutes integerValue] == 0) {
        return [NSString stringWithFormat:@"%@ %@", hour, oclock];
    }else if ([minutes integerValue] == 15) {
        return [NSString stringWithFormat:@"%@ %@ %@", quarter, past, hour];
    }else if ([minutes integerValue] == 30) {
        return [NSString stringWithFormat:@"%@ %@ %@", half, past, hour];
    }else if ([minutes integerValue] == 45) {
        return [NSString stringWithFormat:@"%@ %@ %@", quarter, to, increase];
    } else if ([minutes integerValue] > 50) {
        return [NSString stringWithFormat:@"%@ %@ %@ %@", minutesMin, minutesText, to, increase];
    } else if ([minutes integerValue] > 30) {
        NSInteger index = leftMin % 10;
        NSInteger minutesN = leftMin-index;
        
        return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", minutesN]], [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", index]], minutesText, to, increase];
    } else {
        return [NSString stringWithFormat:@"%@ %@ %@ %@", timeWord, minutesText, past, hour];
    }
    
    return @"";
}
@end
