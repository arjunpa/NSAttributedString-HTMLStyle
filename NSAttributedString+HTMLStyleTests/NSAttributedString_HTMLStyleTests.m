//
//  NSAttributedString_HTMLStyleTests.m
//  NSAttributedString+HTMLStyleTests
//
//  Created by Wojciech Czekalski on 23.03.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSAttributedString+HTMLStyle.h"

@interface NSAttributedString_HTMLStyleTests : XCTestCase

@end

@implementation NSAttributedString_HTMLStyleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReplacing {
    NSData *testData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HTML" ofType:@"html"]];
    testData = [testData dataByReplacingOccurrencesOfString:@"\\n" withString:@"" encoding:NSUTF8StringEncoding];
    NSString *testString = [[NSString alloc] initWithData:testData encoding:NSUTF8StringEncoding];
    
    NSRange range = [testString rangeOfString:@"\\n"];
    
    XCTAssertEqual((NSUInteger)range.location,(NSUInteger) NSNotFound, @"ought not be found");
}

@end