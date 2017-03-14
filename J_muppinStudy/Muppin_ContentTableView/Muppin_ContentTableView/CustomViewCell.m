//
//  CustomViewCell.m
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 13..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import "CustomViewCell.h"

@interface CustomViewCell ()
@property (nonatomic, weak) UIImageView *profileView;
@property (nonatomic, weak) UILabel *userLabel;
@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, weak) UIView *mattBar;
@property (nonatomic, weak) UILabel *mapName;
@property (nonatomic, weak) UILabel *address;
@property NSInteger offsetH;

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
    
    if (self) {
        [self creatSubviews];
    }
    return self;
}

- (void)layoutSubviews {
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

   
    // main image
    UIImageView *imgView = [[UIImageView alloc] init];
    [imgView setImage:[UIImage imageNamed:@"1"]];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [imgView setClipsToBounds:YES];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    
    
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
    
}

- (void)updateLayout {

    self.profileView.frame = CGRectMake(10, HEADER_MARGIN, PROFILE_HEIGHT, PROFILE_HEIGHT);
    self.profileView.layer.cornerRadius = self.profileView.frame.size.width/2;
    self.userLabel.frame = CGRectMake(PROFILE_HEIGHT + 20, HEADER_MARGIN, 150, PROFILE_HEIGHT);
    CGFloat offsetY = HEADER_MARGIN + PROFILE_HEIGHT + 8;
    
    self.imgView.frame = CGRectMake(0, offsetY, self.frame.size.width, self.frame.size.width);
    offsetY = offsetY + self.contentView.frame.size.width;
    
    self.mattBar.frame = CGRectMake(0, offsetY, 7, MATTBAR_HEIGHT);
    self.mapName.frame = CGRectMake(self.mattBar.frame.size.width + 10, offsetY + 10, 150, 10);
    
    self.address.frame = CGRectMake(self.mattBar.frame.size.width + 10, offsetY +30, self.imgView.frame.size.width - 10, 20);
    self.offsetH = HEADER_MARGIN + PROFILE_HEIGHT + self.contentView.frame.size.width + FOOTER_MARGIN;
}


@end




