//
//  AboutCanada.h
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AboutCanada : NSObject

@property (strong, nonatomic) NSString *strTitle;
@property (strong, nonatomic) NSString *strDescription;
@property (strong, nonatomic) NSString *strImageHref;

- (NSString *)title;
- (NSString *)description;
- (NSString *)imageHref;

+ (instancetype)getInfoAboutCanadaWithTitle:(NSString*)title andDescription:(NSString*)description withImage:(NSString*)imageHref;

@end
