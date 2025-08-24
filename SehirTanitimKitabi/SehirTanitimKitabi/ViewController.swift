//
//  ViewController.swift
//  SehirTanitimKitabi
//
//  Created by Özlem CİHAN on 3.08.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    var sehirDizisi = [Sehir]()
    var kullaniciSecimi : Sehir?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let ankara = Sehir(isim: "Ankara", bolge: "İç Anadolu", resim: UIImage(named: "ankara")!)
        let ankara_6_asama = Sehir(isim: "Ankara_6_asama", bolge: "İç Anadolu", resim: UIImage(named: "ankara_6_asama")!)
        let batman = Sehir(isim: "Batman", bolge: "Yok", resim: UIImage(named: "batman")!)
        let captain_america = Sehir(isim: "Captain America", bolge: "Yok", resim: UIImage(named: "captain_america")!)
        let spiderman = Sehir(isim: "Spider-Man", bolge: "Yok", resim: UIImage(named: "spiderman")!)
        let superman = Sehir(isim: "Superman", bolge: "Yok", resim: UIImage(named: "superman")!)
        
        sehirDizisi = [ankara, ankara_6_asama, batman, captain_america, spiderman, superman]
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetalisVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetalisVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
        }
    }
}

