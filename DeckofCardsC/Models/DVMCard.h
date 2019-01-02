//
//  DVMCard.h
//  DeckofCardsC
//
//  Created by Jack Knight on 12/31/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

// MARK: - Properties
@property (nonatomic, readonly) NSString *image;

// MARK: - Initialization
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
