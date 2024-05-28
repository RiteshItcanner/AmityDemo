//
//  _BloomFilter.h
//  _BloomFilter
//
//  Original script: https://github.com/jasondavies/bloomfilter.js/blob/master/bloomfilter.js
//
//  Created by Federico Zanetello on 2018/12/04.
//  Copyright (c) 2018 amity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _BloomFilter : NSObject

@property NSMutableData * _Nonnull buckets;

- (nullable instancetype)initWithNumberOfBits:(NSInteger)bits
                        andWithNumberOfHashes:(NSInteger)hashes NS_DESIGNATED_INITIALIZER;

/**
   Adds the given element into the hash
 */
- (void)add:(nonnull NSString *)word;

/**
   Checks whether the given word is possibly inside the hash, or definitely not
 */
- (BOOL)test:(nonnull NSString *)word;

/**
   Block call of `init` and `new` because this object cannot be created directly
 **/
- (nonnull instancetype)init NS_UNAVAILABLE;
+ (nonnull instancetype)new NS_UNAVAILABLE;

@end
