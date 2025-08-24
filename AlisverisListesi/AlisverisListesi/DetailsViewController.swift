//
//  DetailsViewController.swift
//  AlisverisListesi
//
//  Created by Özlem CİHAN on 7.08.2025.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimTextLabel: UITextField!
    @IBOutlet weak var fiyatTextLabel: UITextField!
    @IBOutlet weak var bedenTextField: UITextField!
    
    @IBOutlet weak var kaydetButton: UIButton!
    var secilenUrunIsmi = ""
    var secilenUrunUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsmi != "" {
            //Core Datadan bigliler getirilecek
            
            kaydetButton.isHidden = true
            
            if let uuidString = secilenUrunUUID?.uuidString {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)   //Mantıksal bazı sınırlamalar koyacağız ve arama ona göre olucak bu satır ile
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let sonuclar = try context.fetch(fetchRequest)
                    
                    if sonuclar.count > 0 {
                        for sonuc in sonuclar as! [NSManagedObject] {
                            if let isim = sonuc.value(forKey: "isim") as? String {
                                isimTextLabel.text = isim
                            }
                            
                            if let fiyat = sonuc.value(forKey: "fiyat") as? Int {
                                fiyatTextLabel.text = String(fiyat)
                            }
                            
                            if let beden = sonuc.value(forKey: "beden") as? String {
                                bedenTextField.text = beden
                            }
                            
                            if let gorselData = sonuc.value(forKey: "gorsel") as? Data {
                                let image = UIImage(data: gorselData)
                                imageView.image = image
                            }
                        }
                    }
                } catch {
                    
                }
            }
           
        }else {
            kaydetButton.isHidden = false
            kaydetButton.isEnabled = false
            isimTextLabel.text = ""
            fiyatTextLabel.text = ""
            bedenTextField.text = ""
            
        }
        
       

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer) //herhangi bir yere tıklanınca view in kendisine atanacak
        
        imageView.isUserInteractionEnabled = true //kullanıcı tarafından tıklanabilir hale getirdik
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resimSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
        
    }
        
    @objc func resimSec() {
        let picker = UIImagePickerController() // bizi başka bir yere( kütüphane, kamera vb. götürecek
        picker.delegate = self
        picker.sourceType = .photoLibrary //Kaynağını belirtir
        picker.allowsEditing = true //resim düzenlemeye izin verdik
        present(picker, animated: true, completion: nil) // alert gibi bir şey
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        kaydetButton.isEnabled = true
        self.dismiss(animated: true, completion: nil) //imagePicker ı kapat ve viewcontroller a geri dön
        
    }
    
    @objc func klavyeyiKapat() {
        view.endEditing(true)
        
    }
    
    @IBAction func kaydetButonTiklandi(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(isimTextLabel.text!, forKey: "isim")
        alisveris.setValue(bedenTextField.text!, forKey: "beden")
        
        if let fiyat = Int(fiyatTextLabel.text!) {
            alisveris.setValue(fiyat, forKey: "fiyat")
        }

        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5) //Sıkıştırma Kalitesi - yarısına kadar sıkıştırma payı verdik
        alisveris.setValue(data, forKey: "gorsel")
        
        do {
            try context.save()
            print("kayıt edildi.")
        }catch {
            print("hata var.")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
