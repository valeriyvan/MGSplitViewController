//
//  RootViewController.m
//  MGSplitView
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import "RootViewController.h"
#import "DetailViewController.h"

#define kFontSize 14.0

@implementation RootViewController


@synthesize array, detailViewController;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.array = [NSArray arrayWithObjects:@"http://github.com/valeriyvan/MGSplitViewController", @"http://mattgemmell.com", @"http://opencv.org", @"http://www.odesk.com", @"http://yandex.com", @"http://yahoo.com", @"http://cnn.com", @"http://times.com", @"http://ebay.com", @"http://paypal.com", @"http://apple.com", @"http://ibm.com", @"http://microsoft.com", @"http://hp.com", @"http://oracle.com", @"http://w7software.com", @"http://oreilly.com", @"http://amazon.com", @"http://ask.com", @"http://www.raspberrypi.org", @"http://wikipedia.org", @"http://developer.apple.com", @"http://youdo.com", @"http://www.thelongestlistofthelongeststuffatthelongestdomainnameatlonglast.com", @"http://www.llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch.com", @"http://odessa.ua", @"http://icloud.com", @"http://dropbox.com", @"http://sugarsync.com", @"http://twitter.github.com/bootstrap", @"http://ua.vlasenko.net", @"http://www.gismeteo.ua/city/daily/4982", @"http://www.whatismyip.com", @"http://internet.yandex.com", @"http://english.odessa.ua", @"http://admincourt.net", @"http://rada.gov.ua", @"http://tema.ru/travel", nil];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
}


// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
#ifdef __IPHONE_6_0
-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
#endif
// This will never be called since 6.0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)selectFirstRow
{
	if ([self.tableView numberOfSections] > 0 && [self.tableView numberOfRowsInSection:0] > 0) {
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
		[self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
		[self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
	}
}


#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell.
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:kFontSize];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = [array objectAtIndex:indexPath.row];
	CGSize constrainedSize = CGSizeMake(tableView.frame.size.width - 80, MAXFLOAT);
	CGSize sizeOfText = [text sizeWithFont:[UIFont systemFontOfSize:kFontSize] constrainedToSize:constrainedSize];
	CGFloat defaultHeight =  40;
	return fmax(sizeOfText.height + 10, defaultHeight);
}

#pragma mark -
#pragma mark Table view delegate


- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
    detailViewController.detailItem = [self.array objectAtIndex:indexPath.row];
}


#pragma mark -
#pragma mark Memory management


- (void)dealloc
{
    [array release];
    [detailViewController release];
    [super dealloc];
}


@end
