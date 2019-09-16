import UIKit
import Firebase
import FirebaseAuth
class MainViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var AvatarImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CoffeImage: UIImageView!
    @IBOutlet weak var AboutCoffeLabel: UILabel!
    @IBAction func wantCoffeButton(_ sender: UIButton) {
        let defaults = UserDefaults.standard
    }
    var scrollArray: [ScrollViewImage] = {
        
        var Latte = ScrollViewImage()
        
        Latte.image = "ЛАТТЕ"
        Latte.name = "Пошло"
        
        var Americano = ScrollViewImage()
        
        Americano.image = "Американо"
        Americano.name = "Все"
        var Espresso = ScrollViewImage()
        
        Espresso.image = "Эспрессо"
        Espresso.name = "в Пизду"
        return [Latte, Americano, Espresso]
    }()
    var frame = CGRect (x:0,y:0,width: 375,height: 150)
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        super.viewDidLoad()
        pageControl.numberOfPages = scrollArray.count
        for index in 0..<scrollArray.count {
            let imgView = UIImageView(frame:frame)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? ScrollCollectionViewCell {
            cell.good = scrollArray[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scrollArray.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let good = scrollArray[indexPath.row]
        self.performSegue(withIdentifier: "showScrollView", sender: good)
    }
}
