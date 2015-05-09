//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@protocol FormularioContatoViewControllerDelegate <NSObject>

-(void)contatoAtualizado:(Contato *)contato;
-(void)contatoAdicionado:(Contato *)contato;

@end

@interface FormularioContatoViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *lat;
@property IBOutlet UITextField *lng;
@property IBOutlet UITextField *site;
@property IBOutlet UIButton *botaoFoto;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loading;

@property (strong) Contato *contato;

@property ContatoDAO *dao;
@property(weak) id<FormularioContatoViewControllerDelegate> delegate;

-(IBAction)selecionaFoto:(id)sender;
-(IBAction)buscarCoordenadas:(id)sender;

@end

