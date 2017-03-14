//
//  ViewController.m
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 13..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CustomViewCellDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic) NSArray *dataArray;
@property (nonatomic) CGFloat height;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@{@"photo":@"deadpool", @"context":@"가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아"},
                       @{@"photo":@"deadpool", @"context":@""},
                       @{@"photo":@"", @"context":@"가나다라마바사아가나다라마바사가나다라마바사아가나다라마바사"}];
    
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
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[CustomViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.delegate = self;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"heightForRowAtIndexPath");
    return HEADER_MARGIN + PROFILE_HEIGHT + MATTBAR_HEIGHT + self.tableView.frame.size.width + FOOTER_MARGIN;

}

- (void)contextHeight:(CGFloat)height {
    
    self.height = height;
    
}



@end
