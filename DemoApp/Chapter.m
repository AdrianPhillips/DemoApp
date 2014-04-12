//
//  Chapter.m
//  Runner Runner
//
//  Created by Adrian Phillips on 2/24/14.
//  Copyright (c) 2014 Adrian Phillips. All rights reserved.
//

#import "Chapter.h"
#import "MyScene.h"
#import "MainMenuScene.h"
#import "GameOverScene.h"


@interface Chapter ()
@property BOOL contentCreated;
@end

@implementation Chapter

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        SKSpriteNode * bg = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        bg.alpha = 0.4;
        [self addChild:bg];

        // to do: remove this label if you don't need it.
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
        
        myLabel.text = @"Chapters";// Note: name the chapters
        myLabel.fontSize = 30;
        myLabel.fontColor = [UIColor whiteColor];
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),280);
        [self addChild:myLabel];
    }
    return self;
}

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    
    // to do: create a generic BG for this section
    
    //self.backgroundColor = [SKColor blueColor];
    //self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self button]];
    [self addChild: [self backButton]];
}

- (SKLabelNode *)backButton
{
    SKLabelNode *button = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    button.text = @"Return";
    button.fontSize = 25;
    button.position = CGPointMake(450, 50);
    button.name = @"Back";
    return button;
}

- (SKLabelNode *)button
{
    SKLabelNode *button = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    button.text = @"Zombie 1";
    button.fontSize = 25;
    button.position = CGPointMake(80, 200);
    button.name = @"button";
    return button;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"button"]) {
        [self runButtonActionOnNode:node];
    }
    else if ([node.name isEqualToString:@"Back"]) {
        [self runButtonActionOnNodeBack:node];
    }
}

-(void)runButtonActionOnNodeBack:(SKNode*) node{
    node.name = nil;
    //SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
    SKAction *zoom = [SKAction scaleTo: 1.5 duration: 0.25];
    SKAction *pause = [SKAction waitForDuration: 0.5];
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[zoom, pause, fadeAway, remove]];
    [node runAction: moveSequence completion:^{
        SKScene *mainMenu  = [[MainMenuScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:mainMenu transition:doors];
    }];
}

-(void)runButtonActionOnNode:(SKNode*) node{
    node.name = nil;
    //SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
    SKAction *zoom = [SKAction scaleTo: 1.5 duration: 0.25];
    SKAction *pause = [SKAction waitForDuration: 0.5];
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[zoom, pause, fadeAway, remove]];
    [node runAction: moveSequence completion:^{
        SKScene *myScene  = [[MyScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:myScene transition:doors];
    }];
}

@end
