//
//  ConfirmaPagamento.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/23/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class ConfirmaPagamento: UIViewController {

    var qtdIng:Int!
    var valorTot:Double!
	@IBOutlet weak var parabensMsg: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		parabensMsg.text = "Parabéns, sua compra de \(qtdIng) ingressos (total: R$\(valorTot)) foi concluida!"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ok(sender: UIButton) {
        performSegueWithIdentifier("oksegue", sender: self)
    }

}
