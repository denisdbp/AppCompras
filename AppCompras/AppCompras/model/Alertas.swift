//
//  Alertas.swift
//  AppCompras
//
//  Created by Admin on 30/12/21.
//

import Foundation

import UIKit

class Alertas {
    
    func exibeAlertaLogin(titulo: String, mensagem: String, controller: UIViewController){
        let botaoOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alerta.addAction(botaoOk)
        controller.present(alerta, animated: true, completion: nil)
    }
    
    func exibeAlertaProduto(titulo: String, mensagem: String, controller: UIViewController, handler: ((UIAlertAction) -> Void)? = nil){
        let botaoOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let botaoDeletar = UIAlertAction(title: "Apagar", style: .destructive, handler: handler)
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alerta.addAction(botaoOk)
        alerta.addAction(botaoDeletar)
        controller.present(controller, animated: true, completion: nil)
        
    }
    
    func exibeAlertaCadastroProduto(titulo: String, mensagem: String, controller: UIViewController){
        let botaoOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alerta.addAction(botaoOk)
        controller.present(alerta, animated: true, completion: nil)
    }
}
