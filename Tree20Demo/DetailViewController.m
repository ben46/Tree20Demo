//
//  DetailViewController.m
//  Tree20Demo
//
//  Created by nobby heell on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Three20/Three20.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

- (void)dealloc
{
    [_detailItem release];
    [_detailDescriptionLabel release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release]; 
        _detailItem = [newDetailItem retain]; 

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


-(void)addStyledLabel{
    
    NSString* kText = @"\
    This is a test of styled labels.  Styled labels support \
    <b>bold text</b>, <i>italic text</i>, <span class=\"blueText\">colored text</span>, \
    <span class=\"largeText\">font sizes</span>, \
    <span class=\"blueBox\">spans with backgrounds</span>, inline images \
    <img src=\"bundle://smiley.png\"/>, and <a href=\"http://www.google.com\">hyperlinks</a> you can \
    actually touch. URLs are automatically converted into links, like this: http://www.foo.com\
    <div>You can enclose blocks within an HTML div.</div>\
    Both line break characters\n\nand HTML line breaks<br/>are respected.";
    
    TTStyledTextLabel* label1 = [[[TTStyledTextLabel alloc] initWithFrame:self.view.bounds] autorelease];
    label1.font = [UIFont systemFontOfSize:17];
    TTStyledText * tmpText = [TTStyledText textFromXHTML:kText lineBreaks:NO URLs:YES];
    label1.text = tmpText;
    label1.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [self.view addSubview: label1];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    [self addStyledLabel];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}



							
@end
