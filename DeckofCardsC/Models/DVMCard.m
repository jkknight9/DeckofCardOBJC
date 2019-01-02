//
//  DVMCard.m
//  DeckofCardsC
//
//  Created by Jack Knight on 12/31/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

// MARK: - Initialization\

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *cards = dictionary[@"cards"];
        NSDictionary *cardDictionary = [cards firstObject];
        NSString *image = cardDictionary[@"image"];
        _image= image;
    }
    return self;
}

@end
