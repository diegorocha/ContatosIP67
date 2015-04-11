//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormularioContatoViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;


-(IBAction)pegaDadosDoFormulario;

@end

