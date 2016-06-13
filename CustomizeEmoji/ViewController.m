//
//  ViewController.m
//  CustomizeEmoji
//
//  Created by Samana Tahir on 09/06/2016.
//  Copyright © 2016 Samana Tahir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView* inputAccessoryView;
    NSArray *emoticons;
    NSMutableArray *emoattached;
}

@end

@implementation ViewController
@synthesize tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    emoattached = [[NSMutableArray alloc] init];
    CGRect accessFrame = CGRectMake(0.0, 0.0, 768.0, 277.0);
    inputAccessoryView = [[UIScrollView alloc] initWithFrame:accessFrame];
    [inputAccessoryView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/2)];
        
        [inputAccessoryView setScrollEnabled:YES];
    
         emoticons = [[NSArray alloc] initWithObjects:@"02.png",
                                    @"iphone-6+-size-_04.png",
                                    @"iphone-6+-size-_05.png",
                                    @"iphone-6+-size-_08.png",
                                    @"iphone-6+-size-_09.png",
                                    @"iphone-6+-size-_10.png",
                                    @"iphone-6+-size-_13.png",
                                    @"iphone-6+-size-_14.png",
                                    @"iphone-6+-size-_15.png",
                                    @"iphone-6+-size-_17.png",
                                    
                                    @"boy/iphone-6+-size-_03.png",
                                    @"boy/iphone-6+-size-_04.png",
                                    @"boy/iphone-6+-size-_06.png",
                                    @"boy/iphone-6+-size-_09.png",
                                    @"boy/iphone-6+-size-_10.png",
                                    @"boy/iphone-6+-size-_12.png",
                                    @"boy/iphone-6+-size-_17.png",
                                    @"boy/iphone-6+-size-_18.png",
                                    @"boy/iphone-6+-size-_20.png",
                                    @"boy/iphone-6+-size-_24.png",
                                    
                                    @"girl/iphone-6+-size-_02.png",
                                    @"girl/iphone-6+-size-_03.png",
                                    @"girl/iphone-6+-size-_05.png",
                                    @"girl/iphone-6+-size-_09.png",
                                    @"girl/iphone-6+-size-_10.png",
                                    @"girl/iphone-6+-size-_13.png",
                                    @"girl/iphone-6+-size-_16.png",
                                    @"girl/iphone-6+-size-_17.png",
                                    @"girl/iphone-6+-size-_18.png",
                                    @"girl/iphone-6+-size-_23.png",
                                    
                                    @"halloween/iphone-6+-size-_02.png",
                                    @"halloween/iphone-6+-size-_03.png",
                                    @"halloween/iphone-6+-size-_05.png",
                                    @"halloween/iphone-6+-size-_08.png",
                                    @"halloween/iphone-6+-size-_09.png",
                                    @"halloween/iphone-6+-size-_11.png",
                                    @"halloween/iphone-6+-size-_16.png",
                                    @"halloween/iphone-6+-size-_17.png",
                                    @"halloween/iphone-6+-size-_19.png",nil];
    
    
    
    for( int i = 0; i < [emoticons count]; i++ )
    {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((i % 7)*50, 10 + 50*(i / 7), 45, 45);
       // [button setTitle: [emoticonsCharacters objectAtIndex:i] forState:UIControlStateNormal];
        [button setImage: [UIImage imageNamed:[emoticons objectAtIndex:i]] forState:UIControlStateNormal];
        [button setTag:i];
        [button addTarget:self action:@selector(enterEmoticon:) forControlEvents:UIControlEventTouchDown];
        [inputAccessoryView addSubview:button];
    }
    
    

   // self.textInput.inputAccessoryView = inputAccessoryView.inputAccessoryView;
    
  //  [self.textInput resignFirstResponder];
    self.textInput.inputView = inputAccessoryView;
  //  [self.textInput becomeFirstResponder];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)enterEmoticon:(UIButton*)sender
{

    NSLog(@"button pressed");
   //self.textInput.inputAccessoryView = inputAccessoryView.inputView;
    NSTextAttachment *emoAttach = [[NSTextAttachment alloc]init];
    emoAttach.bounds = CGRectMake(0, 0, 45,45);
    emoAttach.image = sender.imageView.image;
    [emoattached addObject:emoAttach];
    [self.textInput.textStorage insertAttributedString:[NSAttributedString attributedStringWithAttachment:emoAttach]
                                          atIndex:self.textInput.selectedRange.location];
    
    //Move selection location
    self.textInput.selectedRange = NSMakeRange(self.textInput.selectedRange.location + 1, self.textInput.selectedRange.length);
    [self.textInput resignFirstResponder];
    [self.tableView reloadData];
    
    
    
    ////////////////////////////////////SaveData/////////////////////////
    
//    NSString *imagePath  = [emoticons objectAtIndex:sender.tag];
//    NSString *post = [NSString stringWithFormat:@"message=%@",imagePath];
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    
//    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:@"http://54.67.44.136/api/localchat/new"]];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody:postData];
//    
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
//        NSLog(@"requestReply: %@", requestReply);
//    }] resume];
//    
    
    
    
   
}


-(void) RetrieveData
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://54.67.44.136/api/localchat/getall/32.776664/-96.796988/local/1744"]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"requestReply: %@", requestReply);
    }] resume];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    return [emoattached count];
}


- (UITableViewCell *)tableView:(UITableView *)tableViewEmo cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"cell";
    UITableViewCell *cell = [tableViewEmo dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    NSTextAttachment *emoAttach = [emoattached objectAtIndex:indexPath.row];
    cell.imageView.image = emoAttach.image;
   
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
