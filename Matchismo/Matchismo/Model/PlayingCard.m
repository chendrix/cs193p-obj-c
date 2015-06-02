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
@property (strong, nonatomic, readwrite) NSString *contents;

@end


@implementation PlayingCard

@synthesize contents = _contents;

- (instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank
{
    self = [super init];
    if (self) {
        if (![[[self class] validRanks] containsObject:rank]) {
            return self;
        }
        
        if (![[[self class] validSuits] containsObject:suit]) {
            return self;
        }
        
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

- (NSString *)contents
{
    if (_contents) {
        return _contents;
    } else {
        NSArray *rankStrings = [[self class] rankStrings];
        NSInteger rankIndex = [self.rank integerValue];
        NSString *contents = [rankStrings[rankIndex - 1] stringByAppendingString:self.suit];
        _contents = contents;
    }
    
    return _contents;
}

- (BOOL)isRedCard
{
    return [@[@"♥︎", @"♦︎"] containsObject:self.suit];
}

@end
