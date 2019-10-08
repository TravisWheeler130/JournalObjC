//
//  TRWEntryListTableViewController.m
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWEntryListTableViewController.h"
#import "TRWEntryDetailViewController.h"
#import "TRWEntryController.h"

@interface TRWEntryListTableViewController ()

@end

@implementation TRWEntryListTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TRWEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    TRWEntryController * entryController = [TRWEntryController sharedController];
    TRWEntry * entry = entryController.entries [indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cellToDetailView"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        TRWEntry * entry = [TRWEntryController sharedController].entries[indexPath.row];
        
        TRWEntryDetailViewController * detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}

@end
