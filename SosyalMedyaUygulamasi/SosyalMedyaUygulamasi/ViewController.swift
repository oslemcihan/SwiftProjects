//
//  ViewController.swift
//  SosyalMedyaUygulamasi
//
//  Created by Özlem CİHAN on 13.08.2025.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var sifreTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func girisYapTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) { (authdataresult, error) in
                if error != nil {
                    self.uyariMesaji(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyiniz")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else {
            self.uyariMesaji(titleInput: "Hata!", messageInput: "Email ve Parola Giriniz!")
        }
    }
    
    
    @IBAction func kayitOlTiklandi(_ sender: Any) {
        if emailTextField.text != "" && sifreTextField.text != "" {
            //Kayit olma işlemi gerçekleştirilecek
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { (authdataresult, error) in //Bu yapıya closure diyoruz ve bu taşınabilir mini fonksiyon
                if error != nil {
                    self.uyariMesaji(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyiniz")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else {
            uyariMesaji(titleInput: "Hata!", messageInput: "Email ve Parola Giriniz!")
        }
    }
    
    func uyariMesaji(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil) //present() ile çağırdığında, yeni ekran mevcut ekranın üstünde açılır.
    }
    

}

