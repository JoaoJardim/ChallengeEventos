//
//  ViewController.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/22/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var errado: UILabel!
    @IBOutlet weak var uerrado: UILabel!
    var usuario:User!
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.placeholder="Email"
        text2.placeholder="Senha"
    }
    
    @IBAction func voltar(sender: AnyObject) {
    }
    @IBAction func confirma(sender: AnyObject) {
        if shouldPerformSegueWithIdentifier("segueTest", sender:self)==true
        {
            performSegueWithIdentifier("segueTest" ,sender: self)
        }
    }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool
{
        if identifier == "segueTest"
        {
            if text1.text != usuario.email
            {
                uerrado.hidden=false
                return false
            }
            else
            {
                if text2.text != usuario.senha
                {
                    errado.hidden=false
                    uerrado.hidden=true
                    return false
                }
                else
                {
                    return true
                }
            }

        }
        return true
    }
}

