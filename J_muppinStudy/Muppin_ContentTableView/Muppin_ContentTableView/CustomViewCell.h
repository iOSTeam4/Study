//
//  CustomViewCell.h
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 13..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PROFILE_HEIGHT 20
#define MATTBAR_HEIGHT 50
#define HEADER_MARGIN 20
#define FOOTER_MARGIN 20


@protocol CustomViewCellDelegate;



@interface CustomViewCell : UITableViewCell

@property (nonatomic) id<CustomViewCellDelegate> delegate;

- (void)setContentsWithIndexPath:(NSIndexPath *)indexPath;

@end


@protocol CustomViewCellDelegate <NSObject>

@optional
- (void)contextHeight:(CGFloat)cellHeight hasImg:(BOOL)hasImg;

@end
