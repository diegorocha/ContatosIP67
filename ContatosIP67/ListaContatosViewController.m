//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5065 on 18/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

@implementation ListaContatosViewController


-(id)init {
    self = [super init];
    if(self){
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
    }
    return self;
}
 
-(void)exibeFormulario {
    //[UIAlertController alertControllerWithTitle:@"Alerta" message:@"Aqui vamos exibir o formulário" preferredStyle:(UIAlertControllerStyleAlert)];
    NSLog(@"Aqui vamos exibir o formulário");
}

@end
