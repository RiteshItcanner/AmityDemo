//
//  _BloomFilter+Private.h
//  AmitySDK
//
//  Created by Federico Zanetello on 12/11/18.
//  Copyright © 2018 amity. All rights reserved.
//

#import "_BloomFilter.h"

@interface _BloomFilter ()

/**
   Specifies the number of bits
   @note This number is rounded up to the nearest multiple of 32.
 */
@property (assign, nonatomic) NSInteger m;

/**
   Specifies the number of hashing functions
   @remarks this is named 'k' in the original script
 */
@property (assign, nonatomic) NSInteger k;

- (nonnull NSArray<NSNumber *> *)locationsFor:(nonnull NSString *)string;

- (uint32_t)hash:(nonnull NSData *)data seed:(uint32_t)seed;

@end
