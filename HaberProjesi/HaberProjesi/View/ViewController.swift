//
//  ViewController.swift
//  HaberProjesi
//
//  Created by Özlem CİHAN on 20.08.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewTable : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension //satırların boyutları otomatik olucak
        tableView.estimatedRowHeight = UITableView.automaticDimension //bu ikisni yapak yine yeterli değil opsiyonel olduğu için fonksiyonda bunları çağırmalıyız
        
        veriAl( )
        
    }

    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        Webservice().haberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewTable = NewsTableViewModel(newsList: haberler )
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewTable == nil ? 0 : self.newsTableViewTable.numberOfRowsSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewCell
        let newsViewModel = self.newsTableViewTable?.newsAtIndexPath(indexPath.row)
        cell.titleCell.text = newsViewModel?.title
        cell.storyCell.text = newsViewModel?.story
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}

