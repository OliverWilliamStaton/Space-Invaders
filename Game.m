//
//  Game.m
//  Space Invaders
//
//  Created by Oliver Staton on 8/14/14.
//  Copyright (c) 2014 OllieStat. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

// This code is run every time the screen is touched
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Get the coordinates of the touched location
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    // If the left side of the screen is touched, move it left
    if(point.x < 160)
    {
        ShipMovement = -7;
    }
    // If the right side of the screen is touched, move it right
    else
    {
        ShipMovement = 7;
    }
}

// This code is run every time the touch is moved
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Get the coordinates of the touched location
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];

    // If the left side of the ship, move it left
    if(point.x < Ship.center.x)
    {
        ShipMovement = -7;
    }
    // If the right side of the ship, move it right
    else
    {
        ShipMovement = 7;
    }
}

// This code is run every time the screen touch is released
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    ShipMovement = 0;
}

-(void)Movement
{
    // Move the ship along the X-axis (sideways)
    Ship.center = CGPointMake(Ship.center.x + ShipMovement, Ship.center.y);
    
    // Move the bullet along the Y-axis (downwards)
    Bullet.center = CGPointMake(Bullet.center.x, Bullet.center.y - BulletMovement);
    
    // Reset bullet parameters when it leaves the screen
    if(Bullet.center.y < 0)
    {
        Bullet.hidden = YES;
        BulletsOnScreen = 0;
        BulletMovement = 0;
    }
}

-(IBAction)Start:(id)sender
{
    Start.hidden = YES;
    Exit.hidden = YES;
    Shoot.hidden = NO;
    
    MovementTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Movement) userInfo:nil repeats:YES];
}

-(IBAction)Exit:(id)sender
{

}

-(IBAction)Shoot:(id)sender
{
    if(BulletsOnScreen == 0)
    {
        // Create a bullet in front of the ship
        Bullet.hidden = NO;
        Bullet.center = CGPointMake(Ship.center.x, 487);
        
        // Show that there is a bullet
        BulletsOnScreen = 1;
        
        // Move the bullet on the screen
        BulletMovement = 7;
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    Bullet.hidden = YES;
    Shoot.hidden = YES;

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
