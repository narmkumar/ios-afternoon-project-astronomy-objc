//
//  NMKRover.m
//  Astronomy-Hybrid
//
//  Created by Niranjan Kumar on 1/28/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKRover.h"
#import "SolInformation.swift"
#import "Bridge-Hybrid-Header.h"

@implementation NMKRover

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
    }
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"name"];
    
    return [self initWithName:name];
}

@end
