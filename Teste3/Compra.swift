//
//  Compra.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/24/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import Foundation

class Compra
{
    struct item {
        var qtd:Int!
        var preco:Double!
    }
    var itens:[item]
    var comprador:String!
    
    init(comprador:String,itens:[item])
    {
        self.comprador=comprador
        self.itens=itens
    }
}
