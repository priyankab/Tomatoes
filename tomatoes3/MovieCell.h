//
//  MovieCell.h
//  tomatoes3
//
//  Created by Priyanka Bhalerao on 1/11/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

/* Ask Tim why these properties were not seen when I tried to put them in the class interface MovieCell () extension */

@property (nonatomic,weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;
@property (nonatomic,weak) IBOutlet UILabel *castLabel;
@property (nonatomic,weak) IBOutlet UILabel *summaryLabel;

@end
