//
//  Game.h
//  Space Invaders
//
//  Created by Oliver Staton on 8/14/14.
//  Copyright (c) 2014 OllieStat. All rights reserved.
//

#import <UIKit/UIKit.h>

int ShipMovement;
int BulletMovement;
int BulletsOnScreen;

@interface Game : UIViewController
{
    IBOutlet UIButton *Start;
    IBOutlet UIButton *Exit;
    IBOutlet UIButton *Shoot;
    
    IBOutlet UIImageView *Ship;
    IBOutlet UIImageView *Bullet;
    
    NSTimer *MovementTimer;
}

-(IBAction)Start:(id)sender;
-(IBAction)Exit:(id)sender;
-(IBAction)Shoot:(id)sender;

@end
