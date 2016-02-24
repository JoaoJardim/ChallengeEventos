//
//  Cadastro.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/22/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class Cadastro: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var cpassword: UITextField!
    @IBOutlet weak var errosenhas: UILabel!
    @IBOutlet weak var erroincompleto: UILabel!
    var usuarioc:User!
    override func viewDidLoad() {
        super.viewDidLoad()
        nome.placeholder="Nome"
        mail.placeholder="E-mail"
        password.placeholder="Senha"
        cpassword.placeholder="Confirmar senha"
        mail.text=String()
        }
    @IBAction func voltar(sender: UIButton) {
    }
    @IBAction func confirma(sender: UIButton) {
        let name=nome.text
        let mailsalvo=mail.text
        let senhasalva=password.text
        let confirmasenha=cpassword.text
        if (senhasalva!.isEmpty || mailsalvo!.isEmpty||confirmasenha!.isEmpty||name!.isEmpty)
        {
            erroincompleto.hidden=false
        }
        else
        {
            erroincompleto.hidden=true
            if senhasalva == confirmasenha
            {
                usuarioc = User(nome: nome.text!, senha: password.text!, email: mail.text!)
                performSegueWithIdentifier("test", sender: self)
            }
            else
            {
                errosenhas.hidden=false
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
        if segue.identifier == "test"
        {
        let destination:ViewController=segue.destinationViewController as! ViewController
        destination.usuario=usuarioc
    }
    }
}