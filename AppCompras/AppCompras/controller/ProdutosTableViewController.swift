//
//  ProdutosTableViewController.swift
//  AppCompras
//
//  Created by Admin on 29/12/21.
//

import UIKit

class ProdutosTableViewController: UITableViewController {
    
    //MARK: - Atributos
    
    var produtos: Array<Produtos> = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let botaoAdicionarMaisItens = UIBarButtonItem(title: "Adicionar mais itens ou voltar", style: .plain, target: self, action:
                                    #selector(telaDeCadastro(_:)))
        let botaoLimparLista = UIBarButtonItem(title: "Limpar Lista", style: .plain, target: self, action: #selector(limparLista(_:)))
        navigationItem.leftBarButtonItem = botaoAdicionarMaisItens
        navigationItem.rightBarButtonItem = botaoLimparLista
        
        produtos = ProdutosDao().retornoDados()
        tableView.reloadData()
    }
    
    // MARK: - Metodos
    
    @objc func limparLista(_ action: UIAction){
        produtos.removeAll()
        tableView.reloadData()
        ProdutosDao().salvar(produtos)
    }
    
    @objc func telaDeCadastro(_ action: UIAction){
        let cadastrarProdutosViewController = CadastrarProdutosViewController()
        navigationController?.pushViewController(cadastrarProdutosViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return produtos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let produto = produtos[indexPath.row]
        celula.textLabel?.text = produto.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        celula.addGestureRecognizer(longPress)
        
        return celula
       
    }
    
   @objc func longPress(_ gesture: UIGestureRecognizer){
        if gesture.state == .began{
            guard let indexPath = gesture.view as? UITableViewCell else { return }
            guard let linhaSelecionada = tableView.indexPath(for: indexPath) else { return }
            let produto = produtos[linhaSelecionada.row]
            RemoveProduto(controller: self).removeProduto(produto, handler: {_ in self.produtos.remove(at: linhaSelecionada.row)
                self.tableView.reloadData()
                ProdutosDao().salvar(self.produtos)
            })
        }
    }
}
