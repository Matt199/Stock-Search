//
//  MasterTableViewController.swift
//  Stock Search
//
//  Created by Mateusz Kopacz on 06/02/2019.
//  Copyright © 2019 Mateusz Kopacz. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController, SearchTableDelegate {
    
    
    
    func passSelectedValue(selected stock: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "details") as? DetailsViewController{
            destinationVC.stockSymbol = stock
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    
    var stock = [Stocks(symbol:"AAPL", fullName: "Apple Inc.",price: 174.24),
                  Stocks(symbol:"TSLA", fullName: "Tesla, Inc.", price: 317.22),
                  Stocks(symbol:"GOOG", fullName: "Alphabet Inc.", price: 115.25),
                  Stocks(symbol:"FB",  fullName: "Facebook, Inc.", price: 170.49),
                  Stocks(symbol:"DOW J",fullName: "Dow Jones Industrial Average", price: 23390.30),
                  Stocks(symbol:"AMD", fullName: "Advaned Micro Devices, Inc.", price: 23.26),
                  Stocks(symbol:"EA", fullName: "Electronic Arts Inc.", price: 80.21),
                  Stocks(symbol:"INTC", fullName: "Intel Corporation", price: 49.90),
                  Stocks(symbol:"MSFT", fullName: "Microsoft Corporation", price: 106.03),
                  Stocks(symbol:"MRVL", fullName: "Marvel Technology Group, Inc.", price: 19.04),
                  Stocks(symbol:"MU", fullName: "Micron Technology Group, Inc.", price: 19.04),
                  Stocks(symbol:"CZR", fullName: "Caesars Entertainment Corporation.", price: 9.25),
                  Stocks(symbol:"ATVI", fullName: "Activision Blizzard, Inc.", price: 43.0),
                  Stocks(symbol:"ZNGA", fullName: "Zynga, Inc.", price: 4.51),
                  Stocks(symbol:"MGNX", fullName: "MacroGenics, Inc.", price: 25.60),
                  ]
    
    var resultController: UISearchController?
    private var resultTableController: SearchTableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Stocks"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        resultTableController = (storyboard?.instantiateViewController(withIdentifier: "searchTable") as! SearchTableViewController)
        resultTableController.delegate = self
        resultController = UISearchController(searchResultsController: resultTableController)
        resultController?.searchResultsUpdater = resultTableController
        navigationItem.searchController = resultController
        
        resultController?.obscuresBackgroundDuringPresentation = true
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stock.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as? MasterTableViewCell{
            cell.symbolName.text = stock[indexPath.row].symbol
            cell.FullNameLabel.text = stock[indexPath.row].fullName
            cell.PriceLabel.text = "\(stock[indexPath.row].price)"
            
            return cell
        }
        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "details") as? DetailsViewController{
            destinationVC.stockSymbol = stock[indexPath.row].symbol
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }

}


class MasterTableViewCell: UITableViewCell{
    
    @IBOutlet weak var symbolName: UILabel!
    
    @IBOutlet weak var FullNameLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
}
