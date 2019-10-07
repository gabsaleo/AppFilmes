//
//  Filme.swift
//  AppFilmes
//
//  Created by Gabriella Messias Aleo on 04/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit

class Filme {
//    static func == (lhs: Filme, rhs: Filme) -> Bool {
//        <#code#>
//    }
    
    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    
    init(titulo:String, descricao:String, image: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = image
    }
}
