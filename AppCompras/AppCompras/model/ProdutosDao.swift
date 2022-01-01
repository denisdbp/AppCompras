//
//  ProdutosDao.swift
//  AppCompras
//
//  Created by Admin on 30/12/21.
//

import Foundation

class ProdutosDao{
    
    func salvar(_ produtos: [Produtos]){
        guard let destino = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let caminho = destino.appendingPathComponent("produtos")
        do{
        let dados = try NSKeyedArchiver.archivedData(withRootObject: produtos, requiringSecureCoding: false)
            try dados.write(to: caminho)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func exibeDiretorio() -> URL? {
        guard let destino = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let caminho = destino.appendingPathComponent("produtos")
        
        return caminho
    }
    
    func retornoDados() -> [Produtos]{
        guard let caminho = exibeDiretorio() else { return []}
        do{
        let dados = try Data(contentsOf: caminho)
            guard let produtosSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Produtos> else { return []}
            return produtosSalvos

        }catch{
            print(error.localizedDescription)
        }
        
        return []
    }
}
