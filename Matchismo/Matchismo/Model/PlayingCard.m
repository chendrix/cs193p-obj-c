//
//  PlayingCard.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard ()

@property (nonatomic, strong, readwrite) NSString *suit;
@property (nonatomic, readwrite) NSNumber *rank;

@end

@implementation PlayingCard

- (instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank
{
    if ([[[self class] validRanks] containsObject:rank] && [[[self class] validSuits] containsObject:suit]) {
        NSArray *rankStrings = [[self class] rankStrings];
        
        NSInteger rankIndex = [rank integerValue];
        NSString *contents = [rankStrings[rankIndex - 1] stringByAppendingString:suit];
        self = [super initWithContents:contents];
    } else
    {
        self = nil;
    }
    
    if (self) {
        self.rank = rank;
        self.suit = suit;
    }
    
    return self;
}

+ (NSArray *)validSuits
{
    return @[@"♣︎", @"♠︎", @"♥︎", @"♦︎"];
}

+ (NSArray *)validRanks
{
    return @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
}

+ (NSArray *)rankStrings
{
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

@end
