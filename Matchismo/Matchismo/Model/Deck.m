//
//  Deck.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck ()

@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation Deck

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cards = [NSMutableArray new];
    }
    return self;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *randomCard;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

- (NSUInteger)size
{
    return [self.cards count];
}

@end
