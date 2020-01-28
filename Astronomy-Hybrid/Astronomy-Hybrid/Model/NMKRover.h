//
//  NMKRover.h
//  Astronomy-Hybrid
//
//  Created by Niranjan Kumar on 1/28/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SolInformation;

NS_SWIFT_NAME(MarsRover)
@interface NMKRover : NSObject

@property (nonatomic, copy, nonnull) NSString *name;

- (nonnull instancetype)initWithName:(nonnull NSString *)name;

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

