//
//  ViewControllerTableViewCell.h
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgIcon;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


@end
