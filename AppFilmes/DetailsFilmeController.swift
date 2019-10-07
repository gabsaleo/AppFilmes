//
//  DetailsFilmeController.swift
//  AppFilmes
//
//  Created by Gabriella Messias Aleo on 04/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
import UIKit

class DetailsFilmeController : UIViewController{
    
    @IBOutlet var filmeImageView: UIImageView!
    @IBOutlet weak var nomeFilme: UILabel!
    @IBOutlet weak var descricaoFilme: UILabel!
    
    var filme:Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmeImageView.image = filme?.imagem
        nomeFilme.text = filme?.titulo
        descricaoFilme.text = filme?.descricao
        
        
        
        
        
        
        
    }
}
