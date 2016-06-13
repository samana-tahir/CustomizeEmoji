//
//  ViewController.h
//  CustomizeEmoji
//
//  Created by Samana Tahir on 09/06/2016.
//  Copyright © 2016 Samana Tahir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextView *textInput;


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

