#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    if ([month integerValue] > 12 || ([month integerValue] == 2 && [day integerValue] > 28) || [day integerValue] > 31) {
        return @"Такого дня не существует";
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDateFormatter *resultFormat = [[NSDateFormatter alloc] init];
    
    dateFormat.dateFormat = @"yyyy-MM-dd";
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    
    resultFormat.dateFormat = @"d MMMM, EEEE";
    resultFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    
    return [resultFormat stringFromDate: [dateFormat dateFromString: [NSString stringWithFormat:@"%@-%@-%@", year, month, day]]];
}

@end
