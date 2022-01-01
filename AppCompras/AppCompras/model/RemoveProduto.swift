//
//  RemoveProduto.swift
//  AppCompras
//
//  Created by Admin on 31/12/21.
//

import Foundation
import UIKit

class RemoveProduto{
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func removeProduto(_ produtos: Produtos, handler: @escaping (UIAlertAction) -> Void){
        let alertController = UIAlertController(title: produtos.nome, message: String(produtos.preco), preferredStyle: .alert)
                let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                alertController.addAction(botaoCancelar)
                // Aqui o handler e uma closure
                let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
                alertController.addAction(botaoRemover)
                controller.present(alertController, animated: true, completion: nil)
    }
    
}
