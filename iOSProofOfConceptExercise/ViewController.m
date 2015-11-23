//
//  ViewController.m
//  iOSProofOfConceptExercise
//
//  Created by Ryan Enguero on 23/11/2015.
//  Copyright © 2015 TapDash Heuristics. All rights reserved.
//

#import "ViewController.h"

#import "ViewControllerTableViewCell.h"

#import "ParserClass.h"

#import "AboutCanada.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Title for navigation Bar
    [self.navigationItem setTitle:@"Facts"];
    
    // JSON Feed from Appfibre
    NSURL *url = [NSURL URLWithString:@"http://guarded-basin-2383.herokuapp.com/facts.json"];
    
    // NSURLSeession
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        // Parser class where it parse all the data downloaded from webservice
        [[ParserClass sharedItems] getDataAboutCanada:json];
        
        // reload the table to see the updates
        [self.tableView reloadData];
        
    }] resume];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Delegate and Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    //Count of data from webservice
    return [[[ParserClass sharedItems] aboutCanada] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Configure Cell
    
    static NSString *cellIdentifier = @"cell";
    
    ViewControllerTableViewCell *cell = (ViewControllerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ViewControllerTableViewCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    // Model Parsing
    AboutCanada *aboutCanada = [[ParserClass sharedItems] aboutCanada][indexPath.row];
    
    
    cell.lblTitle.text = [aboutCanada title];
    cell.lblDescription.text = [aboutCanada description];
    
    
    // Lazy loading of Images
    dispatch_queue_t imageQueue = dispatch_queue_create("imageDownloader", nil);
    
    dispatch_async(imageQueue, ^{
        
        NSURL *imageUrl = [NSURL URLWithString:[aboutCanada imageHref]];
        
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        
        UIImage *image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.activityView stopAnimating];
            [cell.activityView setHidden:YES];
            cell.imgIcon.image = image;
            
        });
    });
    
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
