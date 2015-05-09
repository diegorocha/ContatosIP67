//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(NSString *)description{
    return [NSString stringWithFormat:@"Nome: %@, Telefone: %@, E-mail: %@, Endereço: %@, Site: %@;", self.nome, self.telefone, self.email, self.endereco, self.site];
}

-(CLLocationCoordinate2D) coordinate{
    return CLLocationCoordinate2DMake([self.lat doubleValue], [self.lng doubleValue]);
}

-(NSString *) title {
    return self.nome;
}

-(NSString *)subtitle{
    return self.email;
}

@end
