//
//  CadastrarProdutosViewController.swift
//  AppCompras
//
//  Created by Admin on 29/12/21.
//

import UIKit

class CadastrarProdutosViewController: UIViewController {
    
    // MARK: - Atributos
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var valorTextField: UITextField?
    @IBOutlet var totalLabel: UILabel?
    
    let bancoDeDados = BancoDeDados()
    
    let Alerta = Alertas()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let botao = UIBarButtonItem(title: "", style: .done, target: nil, action:
                                    nil)
        navigationItem.leftBarButtonItem = botao
        
        bancoDeDados.produtos = ProdutosDao().retornoDados()
        
        totalLista()
        
    }
    
    //MARK: - Metodos
    
    func totalLista(){
        var total = 0.00
        
        for i in ProdutosDao().retornoDados(){
            total += i.preco
        }
        totalLabel?.text = String(format: "%.2f", total)
    }
    
    @IBAction func buttonInserir(){
        guard let nome = nomeTextField?.text, let valor = valorTextField?.text else { return }
        guard let preco = Double(valor) else { return }
        let produto = Produtos(nome: nome, preco: preco)
        bancoDeDados.produtos.append(produto)
        ProdutosDao().salvar(bancoDeDados.produtos)
        totalLista()
        Alertas().exibeAlertaCadastroProduto(titulo: "Produto cadastrado com sucesso", mensagem: produto.nome, controller: self)
        nomeTextField?.text = ""
        valorTextField?.text = ""
        
    }
    
    @IBAction func buttonLista(){
        let produtosTableViewController = ProdutosTableViewController()
        navigationController?.pushViewController(produtosTableViewController, animated: true)
    }
}
