//
//  NMKRoverController.h
//  Astronomy-Hybrid
//
//  Created by Niranjan Kumar on 1/28/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NMKRover;

@interface NMKRoverController : NSObject

@property (nonatomic, nonnull)NSURL *baseURL;
@property (nonatomic, nonnull)NSString *apiKey;

- (NSURL *_Nonnull)urlRoverInfo:(NSString *_Nonnull)name;

- (void)fetchFromURL:(nonnull NSURL *)url completion:(void (^_Nonnull)(NSDictionary * _Nullable dictionary, NSError  * _Nullable error))completion;
- (void)fetchRoverNamed:(nonnull NSString *)name completion:(void (^_Nonnull)(NMKRover * _Nullable, NSError * _Nullable error))completion;

@end

