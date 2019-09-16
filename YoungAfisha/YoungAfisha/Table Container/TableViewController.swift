//
//  TableViewController.swift
//  YoungAfisha
//
//  Created by руслан on 17/8/19.
//  Copyright © 2019 руслан. All rights reserved.
//
import Foundation
import UIKit
import Firebase
class TableViewController: UITableViewController {
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
            NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
            
            switch indexPath.row {
            case 0: NotificationCenter.default.post(name: NSNotification.Name("Profile"), object: nil)
            case 1: NotificationCenter.default.post(name: NSNotification.Name("BBCNews"), object: nil)
            case 2: NotificationCenter.default.post(name: NSNotification.Name("GermanyNews"), object: nil)
            default: break
            }
        }
        
}
