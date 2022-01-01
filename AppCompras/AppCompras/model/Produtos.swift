//
//  Produtos.swift
//  AppCompras
//
//  Created by Admin on 29/12/21.
//

import Foundation

class Produtos: NSObject, NSCoding {
    
    let nome: String
    let preco: Double
    
    init(nome: String, preco: Double) {
        self.nome = nome
        self.preco = preco
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(preco, forKey: "preco")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        preco = coder.decodeDouble(forKey: "preco")
    }
    
    
}
