//
//  NewsVC.swift
//  NFT News
//
//  Created by Alex Paul on 4/1/21.
//

import UIKit

class NewsVC: UIViewController {
     let news = [News]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        NetworkManger.shared.getArticles()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshcollectionView), name: Notification.Name("didFinishParsing"), object: nil)
    }
    
    func configureCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }

    @objc func refreshcollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NewsVC:UICollectionViewDataSource , UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! NewsGridCell
        let stories = news[indexPath.row]
        cell.setCells(stories)
        return cell
    }
    
    
}
