//
//  DetailViewController.m
//  NotesApp
//
//  Created by Hicham Chourak on 09/07/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import "DetailViewController.h"
#import "Data.h"
#import "GAIDictionaryBuilder.h"

@interface DetailViewController ()

@property (strong, nonatomic) MFMailComposeViewController *picker;

- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [Data setCurrentKey:_detailItem];
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    NSString *currentNote = [[Data getAllNotes] objectForKey:[Data getCurrentKey]];
    
    if (![currentNote isEqualToString:kDefaultText]) {
        self.tView.text = currentNote;
    } else {
        self.tView.text = @"";
    }
    [self.tView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (![self.tView.text isEqualToString:@""]) {
        [Data SetNoteForCurrentKey:self.tView.text];
    } else {
        [Data removeNoteForKey:[Data getCurrentKey]];
    }
    [Data saveNotes];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Google Analytics
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"NoteDetailView"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendEmail:(id)sender
{
    [self sendNoteByEmail];
}

- (void)sendNoteByEmail
{
    self.picker = [[MFMailComposeViewController alloc] init];
    self.picker.mailComposeDelegate = self;
    
    if (self.picker != nil) {
        [self.picker setSubject:@"My Note"];
        [self.picker setMessageBody:self.tView.text isHTML:NO];
        [self presentViewController:self.picker animated:YES completion:nil];
    }
    
    // Google Analytics
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"NoteEmailView"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
