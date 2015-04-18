//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5065 on 02/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

-(id)initWithContato:(Contato *)contato{
    self = [super init];
    if(self){
        self.contato = contato;
    }
    return self;
}

-(void)acoesDoController:(UIViewController *)controller{
    self.controller = controller;
    UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:self.contato.nome delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Enviar Email", @"Visualizar Site", @"Abrir Mapa",nil];
    [opcoes showInView:controller.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;
        default:
            break;
    }
}

-(void) abrirAplicativoComUrl:(NSString *) url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void) ligar {
    UIDevice *device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]){
        NSString *numero = [NSString stringWithFormat:@"tel:%@", self.contato.telefone];
        [self abrirAplicativoComUrl:numero];
    }else{
        [self exibeAlertViewWithTitle:@"Impossível fazer ligação" andMessage: @"Seu dispositivo não é um iPhone"];
    }
}

-(void) enviarEmail {
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *enviadorEmail = [MFMailComposeViewController new];
        enviadorEmail.mailComposeDelegate = self;
        [enviadorEmail setToRecipients:@[self.contato.email]];
        [enviadorEmail setSubject:@"Caelum"];
        
        [self.controller presentViewController:enviadorEmail animated:YES completion:nil];
    }else{
        [self exibeAlertViewWithTitle: @"Oops!" andMessage: @"Não é possível enviar email"];
    }
}

-(void) abrirSite {
    NSString *url = self.contato.site;;
    if(![url hasPrefix:@"http://"]){
        url = [NSString stringWithFormat:@"http://%@", url];
    }
    [self abrirAplicativoComUrl:url];
}

-(void) mostrarMapa {
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", self.contato.endereco] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoComUrl:url];
}

-(void)exibeAlertViewWithTitle: (NSString *)title andMessage: (NSString *)message {
    [[[UIAlertView alloc] initWithTitle: title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

@end
