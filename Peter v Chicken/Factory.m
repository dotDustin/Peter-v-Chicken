//
//  Factory.m
//  Peter v Chicken
//
//  Created by Dustin M on 9/2/15.
//  Copyright (c) 2015 Vento. All rights reserved.
//

#import "Factory.h"

@implementation Factory

-(NSArray *)tiles
{
    Tile *tile1 = [[Tile alloc] init];
    tile1.story = @"Joe & Bonnie Swanson's House";
    tile1.backgroundImage = [UIImage imageNamed:@"t1_joeshouse.png"];
    tile1.actionButtonName = @"Take Joe's Police Pistol";
    Weapon *policePistol = [[Weapon alloc] init];
    policePistol.name = @"Police Pistol";
    policePistol.damage = 20;
    tile1.weapon = policePistol;

    Tile *tile2 = [[Tile alloc] init];
    tile2.story = @"Stop by Peter's job at the Brewery.";
    tile2.backgroundImage = [UIImage imageNamed:@"t2_pawtucketbrewery.jpg"];
    tile2.actionButtonName = @"Have a brewski!";
    tile2.healthEffect = -5;
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.story = @"You cross path's with old man Herbert, he offers you tylenol PM for some reason.";
    tile3.backgroundImage = [UIImage imageNamed:@"t3_herbert.png"];
    tile3.actionButtonName = @"Run!";
    tile3.healthEffect = -2;
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.story = @"Welcome to the Griffin's House";
    tile4.backgroundImage = [UIImage imageNamed:@"t4_griffinshouse.jpg"];
    tile4.actionButtonName = @"Eat some food";
    tile4.healthEffect = 5;
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.story = @"Stop by the Quahog to say hi to Carl and pick up provisions.";
    tile5.backgroundImage = [UIImage imageNamed:@"t5_quahogminimart.jpg"];
    tile5.actionButtonName = @"Take bulletproof vest";
    Armor *bulletproofVest = [[Armor alloc] init];
    bulletproofVest.name = @"Kevlar Vest";
    bulletproofVest.health = 25;
    tile5.armor = bulletproofVest;
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.story = @"Quagmire has let you borrow his cabin in the woods for the night.";
    tile6.backgroundImage = [UIImage imageNamed:@"t6_quagmirescabin.png"];
    tile6.actionButtonName = @"Catch some ZZZs";
    tile6.healthEffect = 3;
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    Tile *tile7 = [[Tile alloc] init];
    tile7.story = @"Meg's home from jail, 'who's in charge?'";
    tile7.backgroundImage = [UIImage imageNamed:@"t7_meg.jpg"];
    tile7.actionButtonName = @"'I'm in charge'";
    tile7.healthEffect = -10;
    
    Tile *tile8 = [[Tile alloc] init];
    tile8.story = @"Visit Dr. Herbert at the hospital";
    tile8.backgroundImage = [UIImage imageNamed:@"t8_quahogmedical.png"];
    tile8.actionButtonName = @"Get a checkup";
    tile8.healthEffect = 9;
    
    Tile *tile9 = [[Tile alloc] init];
    tile9.story = @"You run into scavengers on the way to Natick";
    tile9.backgroundImage = [UIImage imageNamed:@"t9_potatosalad.jpg"];
    tile9.actionButtonName = @"Show Me Potato Salad";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    Tile *tile10 = [[Tile alloc] init];
    tile10.story = @"Glenn Quagmire's house. There's lots of odd weapons here.";
    tile10.backgroundImage = [UIImage imageNamed:@"t10_quagmireshouse.gif"];
    tile10.actionButtonName = @"Take the whip";
    Weapon *whip = [[Weapon alloc] init];
    whip.name = @"Whip";
    whip.damage = 12;
    tile10.weapon = whip;
    
    Tile *tile11 = [[Tile alloc] init];
    tile11.story = @"Meet the guys at the Clam for a drink?";
    tile11.backgroundImage = [UIImage imageNamed:@"t11_thedrunkenclam.jpg"];
    tile11.actionButtonName = @"Bottoms Up";
    tile11.healthEffect = -3;
    
    Tile *tile12 = [[Tile alloc] init];
    tile12.story = @"You found the chicken, he's mad";
    tile12.backgroundImage = [UIImage imageNamed:@"t12_chicken.jpeg"];
    tile12.actionButtonName = @"Fight";
    tile12.healthEffect = -15;
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
    
}

-(Character *)character
{
    Character *character = [[Character alloc] init];
    character.health = 100;
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Shirt";
    armor.health = 1;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 5;
    character.weapon = weapon;
    
    return character;
}

-(Boss *)boss
{
    Boss *boss = [[Boss alloc] init];
    boss.health = 65;
    return boss;
    
}

@end
