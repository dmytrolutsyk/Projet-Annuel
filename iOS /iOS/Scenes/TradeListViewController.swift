//
//  TradeListViewController.swift
//  iOS
//
//  Created by Norman on 29/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class TradeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    enum Identifier: String {
          case trades
         }
    
    let tradeWebService: TradeWebService = TradeWebService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tableView: UITableView!
    
    class func newInstance(trades: [Trade]) -> TradeListViewController {
            let slvc = TradeListViewController()
            slvc.trades = trades
            return slvc
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEdit))
            let cellNib = UINib(nibName: "TradeTableViewCell", bundle: nil)
            self.tableView.register(cellNib, forCellReuseIdentifier: Identifier.trades.rawValue)
            self.tableView.dataSource = self // écouteur des data de la liste
            self.tableView.delegate = self // écouteur des évènements utilisateur
        }
        
        @objc func touchEdit() {
            UIView.animate(withDuration: 0.33) {
                self.tableView.isEditing = !self.tableView.isEditing
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.trades.count
        }
        
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.trades.rawValue, for: indexPath) as! TradeTableViewCell
            let trade = self.trades[indexPath.row]
            cell.nameLabel.text = trade.description
            return cell
          }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            let trade = self.trades[indexPath.row]
            self.tradeWebService.removeScooter(trade: trade) { (success) in
                if success {
                    self.trades.remove(at: indexPath.row)
                    DispatchQueue.main.sync {
                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
        
        func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let res = self.trades[sourceIndexPath.row]
            self.trades.remove(at: sourceIndexPath.row)
            self.trades.insert(res, at: destinationIndexPath.row)
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let trade = self.trades[indexPath.row]
            let detail = ScooterDetailViewController.newInstance(scooter: scooter)
            self.navigationController?.pushViewController(detail, animated: true)
        }
    }
}
