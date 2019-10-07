//
//  ViewController.swift
//  AppFilmes
//
//  Created by Gabriella Messias Aleo on 04/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit


class ViewController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    var listaFilmes: [Filme] = []
    var searchLista = [Filme]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaFilmes.append(Filme(titulo: "007", descricao: "mais um 007", image: UIImage(named: "filme1")!))
        listaFilmes.append(Filme(titulo: "Star Wars", descricao: "chato pq so ela é jedi", image: UIImage(named: "filme2")!))
        listaFilmes.append(Filme(titulo: "star Wars", descricao: "chato pq so ela é jedi", image: UIImage(named: "filme2")!))
        listaFilmes.append(Filme(titulo: "impacto mortal", descricao: "porradaria", image: UIImage(named: "filme3")!))
        listaFilmes.append(Filme(titulo: "Deadpool", descricao: "besteirol", image: UIImage(named: "filme4")!))
        listaFilmes.append(Filme(titulo: "O regresso", descricao: "mt terra e sujeira", image: UIImage(named: "filme5")!))
        listaFilmes.append(Filme(titulo: "A herdeira", descricao: "é filhad alguem , isso é certeza", image: UIImage(named: "filme6")!))
        listaFilmes.append(Filme(titulo: "Regresso do mal", descricao: "bichao é doido", image: UIImage(named: "filme8")!))
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searching) {
          return searchLista.count
        }
         return listaFilmes.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  -> UITableViewCell {
        
        let cellReuse = "cellReuse"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse, for: indexPath) as! FilmeCelula
//        cell.textLabel?.text = listaFilmes[indexPath.row].titulo
        cell.imagem.layer.cornerRadius = 42
        cell.imagem.clipsToBounds = true
        
        if (searching) {
            cell.nomeFilme.text = searchLista[indexPath.row].titulo
            cell.imagem.image = searchLista[indexPath.row].imagem
            cell.subtituloFilme.text = searchLista[indexPath.row].descricao
         } else {
            cell.nomeFilme.text = listaFilmes[indexPath.row].titulo
            cell.imagem.image = listaFilmes[indexPath.row].imagem
            cell.subtituloFilme.text = listaFilmes[indexPath.row].descricao
         }
        
//        cell.nomeFilme.text = listaFilmes[indexPath.row].titulo
//        cell.imagem.image = listaFilmes[indexPath.row].imagem
//        cell.subtituloFilme.text = listaFilmes[indexPath.row].descricao
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText: searchText)
        searching = true
        tableView.reloadData()
    }
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        if searchText != "" {
            searchLista = listaFilmes.filter {filme in
                return  filme.titulo.lowercased().contains(searchText.lowercased())

            }
        }else { self.searchLista = self.listaFilmes}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailsFilme"){
            if let indexPath = tableView.indexPathForSelectedRow{
                if(searching){
                    let filmeSelecionado = self.searchLista[indexPath.row]
                    let viewControllerDestino = segue.destination as! DetailsFilmeController
                    viewControllerDestino.filme = filmeSelecionado
                }else{
                    let filmeSelecionado = self.listaFilmes[indexPath.row]
                    let viewControllerDestino = segue.destination as! DetailsFilmeController
                    viewControllerDestino.filme = filmeSelecionado
                }
                
            }
            
        }
    }

}

