//
//  ViewController.m
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 13..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewCell.h"
#import "DataCenter.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CustomViewCellDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic) NSArray *dataArray;
@property (nonatomic) CGFloat currentCellHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UILabel *context = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 30)];
//
//    [context setNumberOfLines:0];
//    [context setLineBreakMode:NSLineBreakByWordWrapping];
//    [context setPreferredMaxLayoutWidth:self.view.frame.size.width];
//    [context setText:@"가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아"];
//    
//    [context sizeToFit];
//    
//    [self.view addSubview:context];
//    
//    [context setBackgroundColor:[UIColor redColor]];
    

    self.currentCellHeight = 0.0;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// tavleView delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    return [DataCenter sharedInstance].dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[CustomViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.delegate = self;
    
    [cell setContentsWithIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"heightForRowAtIndexPath");
    return self.currentCellHeight;

}

- (void)contextHeight:(CGFloat)cellHeight hasImg:(BOOL)hasImg {
    
    self.currentCellHeight = PROFILE_HEIGHT + MATTBAR_HEIGHT + FOOTER_MARGIN;
    
    if (hasImg) {
        self.currentCellHeight += HEADER_MARGIN + self.tableView.frame.size.width;
    }
    
    if (cellHeight != 0) {
        self.currentCellHeight += cellHeight + HEADER_MARGIN;
    }
}



@end
