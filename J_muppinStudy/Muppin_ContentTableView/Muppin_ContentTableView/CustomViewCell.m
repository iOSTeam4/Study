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
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, self.contentView.frame.size.width, self.offsetH)];
    [self.contentView addSubview:containerView];
    

    
    // profile img view
    UIImageView *profileView = [[UIImageView alloc] init];
    profileView.backgroundColor = [UIColor greenColor];
    [profileView setImage:[UIImage imageNamed:@"deadpool"]];
    [profileView setContentMode:UIViewContentModeScaleAspectFill];
    [profileView setClipsToBounds:YES];
    [containerView addSubview:profileView];
    self.profileView = profileView;

    // user id
    UILabel *userLabel = [[UILabel alloc] init];
    [userLabel setText:@"hansun"];
    //[userLabel setFont:[UIFont fontWithName:@"helvetica" size:15]];
    [userLabel setFont:[UIFont systemFontOfSize:15]];
    [containerView addSubview:userLabel];
    self.userLabel = userLabel;

   
    // main image
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = [UIColor blueColor];
    [imgView setImage:[UIImage imageNamed:@"1"]];
    [containerView addSubview:imgView];
    self.imgView = imgView;
    
    
    //matt left-bar
    UIView *mattBar = [[UIView alloc] init];
    mattBar.backgroundColor = [UIColor redColor];
    [containerView addSubview:mattBar];
    self.mattBar = mattBar;
    
    
    // map name
    UILabel *mapName = [[UILabel alloc] init];
    [mapName setText:@"패스트캠퍼스 본관"];
    [mapName setFont:[UIFont boldSystemFontOfSize:15]];
    [containerView addSubview:mapName];
    self.mapName = mapName;
                               
    // address
    UILabel *address = [[UILabel alloc] init];
    [address setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [address setText:@"서울특별시 강남구 신사동"];
    [containerView addSubview:address];
    self.address = address;
    
}

- (void)updateLayout {
    
    self.profileView.frame = CGRectMake(10, 0, 20, 20);
    self.profileView.layer.cornerRadius = self.profileView.frame.size.width/2;
    
    int MARGIN = 5;
    CGFloat offsetX = self.profileView.frame.size.width;
    CGFloat offsetY = self.profileView.frame.size.height + MARGIN;
    
    self.userLabel.frame = CGRectMake(offsetX + 20, 0, 150, 20);
    self.imgView.frame = CGRectMake(0, offsetY, self.contentView.frame.size.width, self.contentView.frame.size.width);
    
    offsetY = offsetY + self.contentView.frame.size.width;
    self.mattBar.frame = CGRectMake(0, offsetY, 10, 40);
    self.mapName.frame = CGRectMake(self.mattBar.frame.size.width + 10, offsetY +5, 150, 10);
    
    self.address.frame = CGRectMake(self.mattBar.frame.size.width + 10, offsetY +20, self.imgView.frame.size.width - 10, 20);
    self.offsetH = self.profileView.frame.size.height + MARGIN + self.contentView.frame.size.width + self.mattBar.frame.size.height;
}


@end




