//
//  RootViewController.h
//  MGSplitView
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
    NSArray *array;
    DetailViewController *detailViewController;
}

@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

- (void)selectFirstRow;

@end
