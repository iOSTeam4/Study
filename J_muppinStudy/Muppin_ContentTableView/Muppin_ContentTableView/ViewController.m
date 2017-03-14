//
//  ViewController.m
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 13..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[CustomViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return HEADER_MARGIN + PROFILE_HEIGHT + MATTBAR_HEIGHT + self.tableView.frame.size.width + FOOTER_MARGIN;
}


@end
