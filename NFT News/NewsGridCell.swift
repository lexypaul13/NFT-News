//
//  NewsGridCell.swift
//  NFT News
//
//  Created by Alex Paul on 4/1/21.
//

import UIKit

class NewsGridCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsDescription: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    
    func setCells(_ news:News){
        upDateUI(newDescription:news.article?.articleDescription, author: news.article?.author)
    }
    
    private func upDateUI(newDescription:String? , author:String?){
        self.newsDescription.text = newDescription
        self.author.text = author
    }
    
    
}
