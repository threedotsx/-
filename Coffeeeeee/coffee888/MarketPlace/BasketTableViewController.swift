
import UIKit

class BasketTableViewController: UITableViewController {    
    var dictionary = ["Total": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cartArray.count)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Корзина"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? BasketTableViewCell {
            cell.getData(item: cartArray[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cartArray[indexPath.row])
        tableView.isEditing = !tableView.isEditing
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        Order.sharedInstance.sum -= cartArray[indexPath.row].count! * cartArray[indexPath.row].price!
           cartArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            dictionary["Total"] = Order.sharedInstance.sum
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationFromTableViewAboutTotalCoast"), object: nil, userInfo: dictionary)
        }
    }

}
