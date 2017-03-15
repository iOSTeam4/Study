//
//  CustomViewCell.m
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 13..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import "CustomViewCell.h"
#import "DataCenter.h"

@interface CustomViewCell ()
@property (nonatomic, weak) UIImageView *profileView;
@property (nonatomic, weak) UILabel *userLabel;
@property (nonatomic, weak) UIView *mattBar;
@property (nonatomic, weak) UILabel *mapName;
@property (nonatomic, weak) UILabel *address;

@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, weak) UILabel *context;

@property BOOL hasImg;
@property BOOL hasContext;

@end


@implementation CustomViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    NSLog(@"init");
    if (self) {
        [self creatSubviews];
        NSLog(@"%f", self.frame.size.width);
        NSLog(@"%f", self.frame.size.height);
        
    }
    return self;
}

- (void)layoutSubviews {
    NSLog(@"layoutSubviews");
    NSLog(@"%f", self.frame.size.width);
    NSLog(@"%f", self.frame.size.height);

    [self updateLayout];
}

- (void)creatSubviews {
    
    
    // profile img view
    UIImageView *profileView = [[UIImageView alloc] init];
    [profileView setImage:[UIImage imageNamed:@"deadpool"]];
    [profileView setContentMode:UIViewContentModeScaleAspectFill];
    [profileView setClipsToBounds:YES];
    [self.contentView addSubview:profileView];
    self.profileView = profileView;

    // user id
    UILabel *userLabel = [[UILabel alloc] init];
    [userLabel setText:@"hansun"];
    //[userLabel setFont:[UIFont fontWithName:@"helvetica" size:15]];
    [userLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [userLabel setTextColor:[UIColor colorWithRed:238/255.0 green:74/255.0 blue:64/255.0 alpha:1.0]];
    [self.contentView addSubview:userLabel];
    self.userLabel = userLabel;

    //matt left-bar
    UIView *mattBar = [[UIView alloc] init];
    mattBar.backgroundColor = [UIColor colorWithRed:238/255.0 green:74/255.0 blue:64/255.0 alpha:1.0];
    [self.contentView addSubview:mattBar];
    self.mattBar = mattBar;
    
    
    // map name
    UILabel *mapName = [[UILabel alloc] init];
    [mapName setText:@"패스트캠퍼스 본관"];
    [mapName setFont:[UIFont boldSystemFontOfSize:14]];
    [mapName setTextColor:[UIColor colorWithRed:238/255.0 green:74/255.0 blue:64/255.0 alpha:1.0]];
    [self.contentView addSubview:mapName];
    self.mapName = mapName;
                               
    // address
    UILabel *address = [[UILabel alloc] init];
    [address setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    [address setTextColor:[UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0]];
    [address setText:@"서울특별시 강남구 신사동"];
    [self.contentView addSubview:address];
    self.address = address;
    

    // main image
    UIImageView *imgView = [[UIImageView alloc] init];
    [imgView setImage:[UIImage imageNamed:@"1"]];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [imgView setClipsToBounds:YES];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    
    // context
    UILabel *context = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
    context.numberOfLines = 0;
    [context sizeToFit];
    [self.contentView addSubview:context];
    self.context = context;
    
}

- (void)updateLayout {

    self.profileView.frame = CGRectMake(10, HEADER_MARGIN, PROFILE_HEIGHT, PROFILE_HEIGHT);
    self.profileView.layer.cornerRadius = self.profileView.frame.size.width/2;
    self.userLabel.frame = CGRectMake(PROFILE_HEIGHT + 20, HEADER_MARGIN, 150, PROFILE_HEIGHT);
    CGFloat offsetY = HEADER_MARGIN + PROFILE_HEIGHT + 8;
    
    
    if (self.hasImg) {
        self.imgView.frame = CGRectMake(0, offsetY, self.frame.size.width, self.frame.size.width);
        offsetY = offsetY + self.contentView.frame.size.width;
    }
    
    self.mattBar.frame = CGRectMake(0, offsetY, 7, MATTBAR_HEIGHT);
    self.mapName.frame = CGRectMake(self.mattBar.frame.size.width + 10, offsetY + 10, 150, 10);
    
    self.address.frame = CGRectMake(self.mattBar.frame.size.width + 10, offsetY +30, self.imgView.frame.size.width - 10, 20);
    
    offsetY += MATTBAR_HEIGHT;
    
    if (self.hasContext) {
        self.context.frame = CGRectMake(0, offsetY, self.context.frame.size.width, self.context.frame.size.height);
    }
    
}

- (void)setContentsWithIndexPath:(NSIndexPath *)indexPath {
    
    NSString *imgStr = [[[DataCenter sharedInstance].dataArray objectAtIndex:indexPath.row] objectForKey:@"photo"];
    NSString *contextStr = [[[DataCenter sharedInstance].dataArray objectAtIndex:indexPath.row] objectForKey:@"context"];
    
    self.imgView.image = [UIImage imageNamed:imgStr];
    self.context.text = contextStr;
    [self.context sizeToFit];
    
    NSLog(@"%@", self.context.text);
    NSLog(@"%f", self.context.frame.size.height);
    
    self.hasImg = YES;
    self.hasContext = YES;
    
    if ([imgStr isEqualToString:@""]) {
        self.hasImg = NO;
    }
    
    if ([contextStr isEqualToString:@""]) {
        self.hasContext = NO;
    }
    
    [self.delegate contextHeight:self.context.frame.size.height hasImg:self.hasImg];
    
}

@end




