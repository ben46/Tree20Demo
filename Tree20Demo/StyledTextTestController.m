//
//  StyledTextTestController.m
//  Tree20Demo
//
//  Created by nobby heell on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StyledTextTestController.h"

@implementation StyledTextTestController

-(void) loadView{
    [super loadView];
    
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
    TTStyledText * tmpText = [TTStyledText textFromXHTML:kText lineBreaks:YES URLs:YES];
    label1.text = tmpText;
    label1.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [self.view addSubview: label1];
    
}

@end
