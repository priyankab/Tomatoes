//
//  MovieListViewController.m
//  tomatoes3
//
//  Created by Priyanka Bhalerao on 1/11/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import "MovieListViewController.h"


@interface MovieListViewController ()
@property (nonatomic,strong) NSMutableArray *movies;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.movies = [NSMutableArray array];
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *movieList =  [NSArray array];
            movieList = [object valueForKey:@"movies"];
            
            self.movies = [[NSMutableArray alloc] initWithCapacity:movieList.count];
            for (int i=0; i< movieList.count; i++){
             NSDictionary* moviedictionary = [movieList objectAtIndex:i];
             //NSLog (@"%@", moviedictionary);
             Movie* movieModel = [[Movie alloc] initWithDictionary:moviedictionary];
             [self.movies addObject:movieModel];
             }
            //NSLog(@" Size of array is %d",self.movies.count);
            //NSLog(@"%@", object);
            [self.tableView reloadData];
        }];
        
        
    }
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    Movie *movieModel = [self.movies objectAtIndex:indexPath.row];
    
    //Set the title and cast
    cell.titleLabel.text = movieModel.title;
    cell.castLabel.text = movieModel.cast;
    
    //Set the Poster image (This is though not a recommended way. Its better to fetch the data in background
    NSURL* url = [NSURL URLWithString:movieModel.posterUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    cell.posterImageView.image = img;
    
    
    //Set the synopsis
    cell.summaryLabel.text = movieModel.summary;
    cell.summaryLabel.numberOfLines = 4;
    cell.summaryLabel.adjustsFontSizeToFitWidth = NO;
    //cell.textLabel.text = movieModel.title;
    //cell.textLabel.text = movieModel.cast;
    //NSLog(@"%@",cell.textLabel.text);
    
    
    
    return cell;
}

@end
