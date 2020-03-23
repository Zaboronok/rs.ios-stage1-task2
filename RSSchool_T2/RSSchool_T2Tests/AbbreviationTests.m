#import <XCTest/XCTest.h>
#import "AbbreviationMaker.h"

@interface AbbreviationTests : XCTestCase
@property (nonatomic, assign) AbbreviationMaker *abbreviationMaker;
@end

@implementation AbbreviationTests

- (void)setUp {
    self.abbreviationMaker = [[AbbreviationMaker alloc] init];
}

- (void)tearDown {
    self.abbreviationMaker = nil;
}

- (void)testAbbreviationSuccess1 {
    XCTAssertEqualObjects([self.abbreviationMaker abbreviationFromA:@"daBcd" toB:@"ABC"], @"YES");
}

- (void)testAbbreviationSuccess2 {
    XCTAssertEqualObjects([self.abbreviationMaker abbreviationFromA:@"mnbTy" toB:@"BT"], @"YES");
}

- (void)testAbbreviationSuccess3 {
    XCTAssertEqualObjects([self.abbreviationMaker abbreviationFromA:@"qWerty" toB:@"WY"], @"YES");
}

- (void)testAbbreviationFailure1 {
    XCTAssertEqualObjects([self.abbreviationMaker abbreviationFromA:@"ytrewq" toB:@"RY"], @"NO");
}

- (void)testAbbreviationFailure2 {
    XCTAssertEqualObjects([self.abbreviationMaker abbreviationFromA:@"abhfs" toB:@"ASCI"], @"NO");
}

@end
