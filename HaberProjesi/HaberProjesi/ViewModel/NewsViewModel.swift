//
//  NewsViewModel.swift
//  HaberProjesi
//
//  Created by Özlem CİHAN on 20.08.2025.
//

import Foundation

struct NewsTableViewModel {
    
    let newsList : [News]
    func numberOfRowsSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index : Int) -> NewsViewModel {
        let news = self.newsList[index] //buradan gelene index neye denk gelirse
        return NewsViewModel(news: news)               // |
    }                                               // |
}                                                   // |
                                                    // |
                                                    // |
struct NewsViewModel {                                 // |
                                                    // |
    let news : News                                   // <- Buraya yani news e ata
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
    
}
