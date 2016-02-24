//
//  User.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/24/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import Foundation

class User
{
    var nome:String!
    var email:String!
    var senha:String!
    init(nome:String,senha:String,email:String)
    {
        self.nome=nome
        self.senha=senha
        self.email=email
    }
}
