//
//  CriarContaViewController.swift
//  AppCompras
//
//  Created by Admin on 29/12/21.
//

import UIKit

class CriarContaViewController: UIViewController {
    
    //MARK: - Atributos
    
    @IBOutlet var loginTextField: UITextField?
    @IBOutlet var senhaTextField: UITextField?
    
    let bancoDeDados = BancoDeDados()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let botao = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = botao
        
        senhaTextField?.isSecureTextEntry.toggle()
    }
    
    //MARK: - Metodos
    
    @IBAction func buttonCriarConta(){
        guard let login = loginTextField?.text, let senha = senhaTextField?.text else { return }
        let cadastraUsuario = Usuario(login: login, senha: senha)
        bancoDeDados.usuario.append(cadastraUsuario)
        UsuarioDao().salvar(bancoDeDados.usuario)
        navigationController?.popViewController(animated: true)
    }
}
