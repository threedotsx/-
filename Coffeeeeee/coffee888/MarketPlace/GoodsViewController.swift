import UIKit

class GoodsViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var goodsCollectionView: UICollectionView!
    
    var goodsArray: [Goods] = {
        var cappuccino = Goods()
        cappuccino.name = "Капучино"
        cappuccino.description = "Капучино"
        cappuccino.image = "Cupuchino"
        cappuccino.price = 200
        
        var Latte = Goods()
        Latte.name = "Латте"
        Latte.description = "Кофе Латте"
        Latte.image = "Latte"
        Latte.price = 200
        
        var Americano = Goods()
        Americano.name = "Американо"
        Americano.description = "Кофе Американо"
        Americano.image = "Americano"
        Americano.price = 150
        
        var Espresso = Goods()
         Espresso.name = "Эспрессо двойной"
         Espresso.description = "Кофе эспрессо"
         Espresso.image = "Espresso"
         Espresso.price = 120
        
        var Kakao = Goods()
        Kakao.name = "Какао"
        Kakao.description = "Какао"
        Kakao.image = "Kakao"
        Kakao.price = 200
        
        
        return [cappuccino, Latte, Americano, Espresso, Kakao]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20) / 2
        let layout = goodsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let vc = segue.destination as? DetailViewController {
                if let good = sender as? Goods {
                    vc.good = good
                }
            }
        }
    }
}

extension GoodsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = goodsCollectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? GoodCollectionViewCell {
            
            cell.good = goodsArray[indexPath.row]
            
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let good = goodsArray[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: good)
    }
}
