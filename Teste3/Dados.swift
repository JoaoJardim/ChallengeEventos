//
//  Dados.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/24/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import Foundation
import UIKit

class Evento
{
    var nome:String!
    var imagemEvento:UIImage!
    var mapa:UIImage!
    var qtdIngTotal:String!
    var descricao:String?
    struct categoria {
        var preco: Double!
        var qtdAssentosTotal: Int!
        var qtdAssentosLivres: Int!
    }
    var categorias: [categoria]
    
    init(nome:String,qtdIngTotal:String,descricao:String,categorias:[categoria],imagemEvento:UIImage,mapa:UIImage)
    {
        self.nome=nome
        self.qtdIngTotal=qtdIngTotal
        self.descricao=descricao
        self.categorias=categorias
        self.imagemEvento=imagemEvento
        self.mapa=mapa
    }
}
