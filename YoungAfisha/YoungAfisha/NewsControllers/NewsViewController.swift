import UIKit
import Firebase
class NewsViewController: UIViewController {
    var index : Int = 0
    var article: Article?
    

    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = article?.title
        newsDescription.text = article?.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article?.urlToImage ?? ""){
                if let data = try? Data(contentsOf: url){
                    self.imageNews.image = UIImage(data: data)
                }
            }
        }
    }
}
