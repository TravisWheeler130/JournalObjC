//
//  TRWEntryDetailViewController.m
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWEntryDetailViewController.h"
#import "TRWEntryController.h"

@interface TRWEntryDetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *entryTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryTextfield;

@end

@implementation TRWEntryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.entryTitleTextField.text = self.entry.title;
    self.entryTextfield.text = self.entry.text;
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry)
    {
        self.entry.title = self.entryTitleTextField.text;
        self.entry.text = self.entryTextfield.text;
        self.entry.timeStamp = [NSDate date];
    } else {
        TRWEntry *entry = [[TRWEntry alloc] initWithTitle:self.entryTitleTextField.text text:self.entryTextfield.text timeStamp: [NSDate date]];
        
        [[TRWEntryController sharedController] addEntriesObject:entry];
        self.entry = entry;
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender
{
    self.entryTitleTextField.text = @"";
    self.entryTextfield.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setEntry:(TRWEntry *)entry
{
    if (entry != _entry)
    {
        _entry = entry;
        [self updateViews];
    }
}

@end
