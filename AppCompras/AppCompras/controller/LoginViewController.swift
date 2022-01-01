//
//  ViewController.swift
//  AppCompras
//
//  Created by Admin on 29/12/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Atributos
    
    @IBOutlet var loginTextField: UITextField?
    @IBOutlet var senhaTextField: UITextField?
    
    var usuario: Array<Usuario> = []
    let bd = BancoDeDados()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        senhaTextField?.isSecureTextEntry.toggle()

    }
    
    //MARK: - Metodos
    
    @IBAction func buttonEntrar(){
        guard let loginUsuario = loginTextField?.text, let senhaUsuario = senhaTextField?.text else { return }
        usuario = UsuarioDao().retornoDados()
        if loginUsuario == usuario[0].login && senhaUsuario == usuario[0].senha{
            self.dismiss(animated: true, completion: nil)
            let cadastrarProdutosViewController = CadastrarProdutosViewController()
            navigationController?.pushViewController(cadastrarProdutosViewController, animated: true)
        }else{
            Alertas().exibeAlertaLogin(titulo: "Ops...", mensagem: "Usuario e/ou senha incorretos", controller: self)
        }
    }
    
    @IBAction func buttonLembrarUsuarioSenha(){
        usuario = UsuarioDao().retornoDados()
        Alertas().exibeAlertaLogin(titulo: "Usuario e senha", mensagem: "Seu usuario: \(usuario[0].login), senha: \(usuario[0].senha)", controller: self)
    }
    
    @IBAction func buttonCriarConta(){
        self.dismiss(animated: true, completion: nil)
        let criarContaViewController = CriarContaViewController()
        navigationController?.pushViewController(criarContaViewController, animated: true)
    }
}
