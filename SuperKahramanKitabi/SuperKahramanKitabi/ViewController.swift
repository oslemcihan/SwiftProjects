//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by Özlem CİHAN on 30.07.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    
    var secilenIsim = ""
    var secilenGorsel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("Spider-Man")
        superKahramanIsimleri.append("Captain America")
        superKahramanIsimleri.append("Iron Man")
        
        //var superKahramanGorselleri = [UIImage]()
        //superKahramanGorselleri.append(UIImage(named: "batman")!)

        
        superKahramanGorselIsimleri.append("batman")
        superKahramanGorselIsimleri.append("superman")
        superKahramanGorselIsimleri.append("spiderman")
        superKahramanGorselIsimleri.append("captain_america")
        superKahramanGorselIsimleri.append("iron_man")
        
    }
    
    // Kaç tane row olucak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    // Hücrenin içersinde neler gösterilecek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            superKahramanGorselIsimleri.remove(at: indexPath.row)
            superKahramanIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = superKahramanIsimleri[indexPath.row]
        secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanGorselIsmi = secilenGorsel
            
           
        }
    }
}

