//
//  Usuario.swift
//  AppCompras
//
//  Created by Admin on 29/12/21.
//

import Foundation

class Usuario: NSObject, NSCoding {
    
    let login: String
    let senha: String
    
    init(login: String, senha: String) {
        self.login = login
        self.senha = senha
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(login, forKey: "login")
        coder.encode(senha, forKey: "senha")
    }
    
    required init?(coder: NSCoder) {
        login = coder.decodeObject(forKey: "login") as! String
        senha = coder.decodeObject(forKey: "senha") as! String
    }
    
    
}
