//
//  PlayingCard.h
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong, readonly) NSString *suit;
@property (nonatomic, readonly) NSNumber *rank;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank;

+ (NSArray *)validSuits;
+ (NSArray *)validRanks;

@end
