//
//  Contato.h
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Contato : NSObject

@property(strong) NSString *nome;
@property(strong) NSString *telefone;
@property(strong) NSString *email;
@property(strong) NSString *endereco;
@property(strong) NSNumber *lat;
@property(strong) NSNumber *lng;
@property(strong) NSString *site;
@property (strong) UIImage *foto;

@end
