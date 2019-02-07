//
//  DetailsViewController.swift
//  Stock Search
//
//  Created by Mateusz Kopacz on 06/02/2019.
//  Copyright © 2019 Mateusz Kopacz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var stockSymbol: String?
    
    @IBOutlet weak var stockNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockNameLabel.text = stockSymbol!
        
    }
    


}
