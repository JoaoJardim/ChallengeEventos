//
//  Pagamento.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/23/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class Pagamento: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
	
    @IBOutlet weak var obrigatorios: UILabel!
	@IBOutlet weak var cartaoNumerico: UILabel!
	@IBOutlet weak var codigoNumerico: UILabel!
    @IBOutlet weak var codigosafe: UITextField!
    @IBOutlet weak var nometitular: UITextField!
    @IBOutlet weak var numerocard: UITextField!
    @IBOutlet weak var vencPicker: UIPickerView!
    @IBOutlet weak var data: UILabel!
	
    var qtdIng: Int!
    var valorTot: Double!
    var pickerData: [[String]] = {
        var meses	= [String]()
        var anos	= [String]()
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        for mes in 1...12{
            meses.append(String(mes))
        }
        for ano in components.year...(components.year+6){
            anos.append(String(ano))
        }
        
        return [meses, anos]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vencPicker.delegate=self
        self.vencPicker.dataSource=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let date = NSDate()
        let mes = NSCalendar.currentCalendar().component(.Month, fromDate: date)
        
        if(pickerView.selectedRowInComponent(0) < (mes-1) && pickerView.selectedRowInComponent(1) == 0){
            pickerView.selectRow(mes-1, inComponent: 0, animated: true)
        }
    }
    
    @IBAction func confirma(sender: UIButton) {
        let name			= nometitular.text
        let numerocartao	= numerocard.text
        let codigo			= codigosafe.text
        
        // Verify textboxes' contents
        guard !(name!.isEmpty || numerocartao!.isEmpty || codigo!.isEmpty) else{
            obrigatorios.hidden		= false
            cartaoNumerico.hidden	= true
            codigoNumerico.hidden	= true
            return
        }
        guard (Int(numerocartao!) != nil) else{
            obrigatorios.hidden		= true
            cartaoNumerico.hidden	= false
            codigoNumerico.hidden	= true
            return
        }
        guard (Int(codigo!) != nil) else{
            obrigatorios.hidden		= true
            cartaoNumerico.hidden	= true
            codigoNumerico.hidden	= false
            return
        }
        
        // Go to next page
        performSegueWithIdentifier("confirmacaosegue", sender:self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "confirmacaosegue"{
            let destination:ConfirmaPagamento = segue.destinationViewController as!ConfirmaPagamento
            destination.qtdIng		= qtdIng
            destination.valorTot	= valorTot
        }
    }
}