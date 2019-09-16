
import Firebase
import UIKit
import Alamofire
import Moya
class MainVC: UITableViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
        setupNavigationBar()
        if CheckInternet.Connection(){
            loadNews {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } else{
        
            }
        
        
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(showProfile),
                                                   name: NSNotification.Name("Profile"),
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(showSettings),
                                                   name: NSNotification.Name("BBCNews"),
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(showSignIn),
                                                   name: NSNotification.Name("GermanyNews"),
                                                   object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CheckInternet.Connection(){
        }
        else {
            self.Alert (Message: "Не можем подключиться, проверте интернет соединение")
        }
    }
    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isHidden = true
        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
    }

    func Alert (Message: String) {
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.publishedAt
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NewsSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as? NewsViewController)?.article = articles[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    }
    
    
    @objc func showProfile() {
        performSegue(withIdentifier: "Profile", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "BBCNews", sender: nil)
    }
    
    @objc func showSignIn() {
        performSegue(withIdentifier: "GermanyNews", sender: nil)
    }
    
    
   @IBAction func onMoreTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    

        
        
}


