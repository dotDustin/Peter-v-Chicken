//
//  Factory.h
//  Peter v Chicken
//
//  Created by Dustin M on 9/2/15.
//  Copyright (c) 2015 Vento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tile.h"
#import "Character.h"
#import "Boss.h"

@interface Factory : NSObject

-(NSArray *)tiles;
-(Character *)character;
-(Boss *)boss;


@end
