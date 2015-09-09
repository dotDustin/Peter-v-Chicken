//
//  Character.h
//  Peter v Chicken
//
//  Created by Dustin M on 9/2/15.
//  Copyright (c) 2015 Vento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Character : NSObject

@property(strong, nonatomic) Armor *armor;
@property(strong, nonatomic) Weapon *weapon;

@property(nonatomic) int health;
@property(nonatomic) int damage;

//@property(strong,nonatomic) UIImage *characterImage;

@end
