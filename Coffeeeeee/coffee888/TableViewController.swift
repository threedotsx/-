//
//  TableViewController.swift
//  coffe888
//
//  Created by руслан on 9/12/18.
//  Copyright © 2018 руслан. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
          setupNavigationBar()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
}
}
