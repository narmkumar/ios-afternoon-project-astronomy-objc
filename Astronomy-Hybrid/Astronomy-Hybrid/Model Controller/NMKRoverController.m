//
//  NMKRoverController.m
//  Astronomy-Hybrid
//
//  Created by Niranjan Kumar on 1/28/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKRoverController.h"
#import "NMKRover.h"

@interface NMKRoverController() {}
@end

@implementation NMKRoverController
 

- (instancetype)init {
    self = [super init];
    if (self) {
        _baseURL = [NSURL URLWithString:@"https://api.nasa.gov/mars-photos/api/v1"];
        _apiKey = @"9WKz350itgEaZ6tRwxLLC2xYvERJANJmOTFxPgnT";
    }
    return self;
}


- (void)fetchFromURL:(NSURL *)url completion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completion {
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON not a dictionary");
            completion(nil, nil);
        }
        
        completion(json, nil);
    }];
    
    [task resume];
}

- (void)fetchRoverNamed:(NSString *)name completion:(void (^)(NMKRover * _Nullable, NSError * _Nullable))completion {
    NSURL *url = [self urlRoverInfo:name];
    NSLog(@"%@", [url description]);
    [self fetchFromURL:url completion:^(NSDictionary * _Nullable dictionary, NSError * _Nullable error) {
        if (error) {
            return completion(nil, error);
        }
        
        NSDictionary *manifest = dictionary[@"photo_manifest"];
        
        completion([[NMKRover alloc] initWithDictionary:manifest], nil);
    }];
}

- (NSURL *)urlRoverInfo:(NSString *)name {
    NSURL *url = [[self.baseURL
                   URLByAppendingPathComponent:@"manifests"]
                  URLByAppendingPathComponent:name];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value:self.apiKey];
    [components setQueryItems:@[apiKeyItem]];
    
    return [components URL];
}

@end
