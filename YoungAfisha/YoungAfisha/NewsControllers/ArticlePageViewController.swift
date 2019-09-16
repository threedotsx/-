//
//  ArticlePageViewController.swift
//  YoungAfisha
//
//  Created by руслан on 31/8/19.
//  Copyright © 2019 руслан. All rights reserved.
//

import UIKit

class ArticlePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        setupNavigationBar()
        super.viewDidLoad()
        self.dataSource = self
        self.showViewControllers()
        loadNews {
            self.showViewControllers()
        }
    }
        func showViewControllers() {
            DispatchQueue.main.async {
                if let vc = self.pageViewController(for: 0) {
                    self.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
                
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? NewsViewController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? NewsViewController)?.index ?? 0) + 1
        return self.pageViewController(for: index)
    }
    

    
    func pageViewController(for index: Int) -> NewsViewController?{
        if index < 0 {
            return nil
       }
        if index >= articles.count {
            return nil
        }
        let vc = (storyboard?.instantiateViewController(withIdentifier: "NewsSID") as! NewsViewController)
        vc.article = articles[index]
        vc.index = index
        return vc
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

    
}
