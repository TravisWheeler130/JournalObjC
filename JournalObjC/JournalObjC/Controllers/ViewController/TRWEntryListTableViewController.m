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

- (void)viewDidLoad:(BOOL)animated
{
    [super viewDidLoad];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [[[TRWEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    TRWEntryController * entryController = [TRWEntryController sharedController];
    TRWEntry * entry = entryController.entries [indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        TRWEntryController.sharedController(entry: TRWEntry)
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

@end
