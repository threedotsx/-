import UIKit
class СommentsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnMessagesArray) in
            self.tableView.reloadData()
            self.messageArray = returnMessagesArray
        }
    }
}
extension СommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else
        { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileMessage")
        let message = messageArray[indexPath.row]
        cell.configureCell(profileImage: image!, phoneNumber: message.senderId, content: message.content)
        return cell
    }
}
