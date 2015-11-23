//
//  ParserClass.m
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import "ParserClass.h"

#import "AboutCanada.h"

static ParserClass *sharedItem = nil;

@implementation ParserClass

- (NSArray*)aboutCanada{

    return arrJsonData;
}

- (void)getDataAboutCanada:(NSDictionary*)details{

    arrJsonData = [NSMutableArray array];
    
    //Replace all <null> value to avoid crashes
    NSDictionary *dictData = [self nestedDictionaryByReplacingNullsWithNil:details];
    
    //Parse the data from the webservice
    for (int i = 0; i < [dictData[@"rows"] count] ; i++) {
        
        AboutCanada *aboutCanada = [AboutCanada getInfoAboutCanadaWithTitle:dictData[@"rows"][i][@"title"]
                                                             andDescription:dictData[@"rows"][i][@"description"]
                                                                  withImage:dictData[@"rows"][i][@"imageHref"]];
        
        [arrJsonData addObject:aboutCanada];
    }

}

- (NSDictionary *) dictionaryByReplacingNullsWithNil:(NSDictionary*)sourceDictionary {
    
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:sourceDictionary];
    const id nul = [NSNull null];
    
    for(NSString *key in replaced) {
        const id object = [sourceDictionary objectForKey:key];
        if(object == nul) {
            [replaced setValue:nil forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:replaced];
}

-(NSDictionary *) nestedDictionaryByReplacingNullsWithNil:(NSDictionary*)sourceDictionary
{
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:sourceDictionary];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    [sourceDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        object = [sourceDictionary objectForKey:key];
        if([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *innerDict = object;
            [replaced setObject:[self nestedDictionaryByReplacingNullsWithNil:innerDict] forKey:key];
            
        }
        else if([object isKindOfClass:[NSArray class]]){
            NSMutableArray *nullFreeRecords = [NSMutableArray array];
            for (id record in object) {
                
                if([record isKindOfClass:[NSDictionary class]])
                {
                    NSDictionary *nullFreeRecord = [self nestedDictionaryByReplacingNullsWithNil:record];
                    [nullFreeRecords addObject:nullFreeRecord];
                }
            }
            [replaced setObject:nullFreeRecords forKey:key];
        }
        else
        {
            if(object == nul) {
                [replaced setObject:blank forKey:key];
            }
        }
    }];
    
    return [NSDictionary dictionaryWithDictionary:replaced];
}

#pragma mark - SingleTon

+ (ParserClass *)sharedItems
{
    if (sharedItem == nil) {
        sharedItem = [[super allocWithZone:NULL]init];
    }
    return  sharedItem;
}
- (id)init{
    if ((self = [super init])) {
        
    }
    return self;
}
+ (id)allocWithZone:(NSZone *)zone{
    return  [self sharedItems];
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}

@end
