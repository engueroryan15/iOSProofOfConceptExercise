//
//  AboutCanada.m
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import "AboutCanada.h"

@implementation AboutCanada

- (NSString *)title{

    return _strTitle;
}

- (NSString *)description{

    return _strDescription;
}

- (NSString *)imageHref{

    return _strImageHref;
}

+ (instancetype)getInfoAboutCanadaWithTitle:(NSString*)title andDescription:(NSString*)description withImage:(NSString*)imageHref{

    AboutCanada *aboutCanada = [[self alloc] init];
    
    aboutCanada.strTitle = title;
    aboutCanada.strDescription = description;
    aboutCanada.strImageHref = imageHref;
    
    return aboutCanada;
}

@end
