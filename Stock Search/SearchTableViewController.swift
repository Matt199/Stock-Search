//
//  SearchTableViewController.swift
//  Stock Search
//
//  Created by Mateusz Kopacz on 06/02/2019.
//  Copyright © 2019 Mateusz Kopacz. All rights reserved.
//

import UIKit

protocol SearchTableDelegate {
    func passSelectedValue(selected stock: String)
}

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
   
    var delegate: SearchTableDelegate!
    
    let stocks = ["ATVI", "ADBE", "AMD", "ALXN", "ALGN", "GOOG", "GOOGL",
    "AMZN", "AAL", "AMGN", "ADI", "AAPL", "AMAT","ASML","ADSK", "ADP",
    "BIDU", "BIIB", "BMRN", "BKNG", "AVGO", "CDNS", "CELG", "CERN", "CHTR",
    "CHKP", "CTAS", "CSCO", "CTXS", "CTSH", "CMCSA", "COST", "CSX", "CTRP",
    "DLTR", "EBAY", "EA", "EXP", "FB", "FAS", "FISV", "GILD", "HAS", "HSIC",
    "IDXX", "ILMN", "INCY", "INTC", "INTU"]
    
    var filteredStocks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredStocks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
            cell.stockLabel.text = filteredStocks[indexPath.row]
        
            return cell
        

        // Configure the cell...

        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedValue = filteredStocks[indexPath.row]
        delegate.passSelectedValue(selected: selectedValue)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let inputText = searchController.searchBar.text, !inputText.isEmpty {
            filteredStocks = stocks.filter({ (text) -> Bool in
                return text.lowercased().contains(inputText.lowercased())
            })
        }
          
        tableView.reloadData()
    }
    

}

class SearchTableViewCell: UITableViewCell{
    @IBOutlet weak var stockLabel: UILabel!
    
}
