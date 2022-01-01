//
//  UsuarioDao.swift
//  AppCompras
//
//  Created by Admin on 30/12/21.
//

import Foundation

class UsuarioDao{
    
    func salvar(_ usuarios: [Usuario]){
        guard let caminho = exibeDiretorio() else { return }
        do{
        let dados = try NSKeyedArchiver.archivedData(withRootObject: usuarios, requiringSecureCoding: false)
            try dados.write(to: caminho)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func exibeDiretorio() -> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("usuario")
        
        return caminho
    }
    
    func retornoDados() -> [Usuario]{
        guard let caminho = exibeDiretorio() else { return []}
        do{
        let data = try Data(contentsOf: caminho)
            guard let usuarioCadastrado = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Usuario> else { return []}
            return usuarioCadastrado
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    
}
