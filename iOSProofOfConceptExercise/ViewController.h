//
//  ViewController.h
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSURLSessionDelegate>{


    IBOutlet UIActivityIndicatorView *activityView;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableData *receivedData;
@property (strong, nonatomic) NSURLConnection *connection;

@end

