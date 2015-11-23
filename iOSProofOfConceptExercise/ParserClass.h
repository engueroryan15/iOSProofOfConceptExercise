//
//  ParserClass.h
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserClass : NSObject{

    NSMutableArray *arrJsonData;
}

- (NSArray*)aboutCanada;

- (void)getDataAboutCanada:(NSDictionary*)details;

+ (ParserClass*) sharedItems;

@end
