//
//  UploadViewController.swift
//  SosyalMedyaUygulamasi
//
//  Created by Özlem CİHAN on 13.08.2025.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth



class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yorumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true //Kullanıcı bununla işlemler yapabilir yani üstüne falan tıklayabilir
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resimSec))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    @objc func resimSec(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil) //kapatmak için
        
    }

    @IBAction func uploadButtonTiklandi(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let imageReference = mediaFolder.child("image.jpg")
            imageReference.putData(data, metadata: nil) { (storagemetedata, error) in
                if error != nil {
                    self.hataMesjiGoster(title: "Hata", message: error?.localizedDescription ?? "Hata aldınız. Lütfen tekrar deneyiniz!")
                }else {
                    imageReference.downloadURL { (url, error) in
                        if error != nil {
                            let imageUrl = url?.absoluteString
                            
                            if let imageUrl = imageUrl {
                                
                                let fireStoreDatabase = Firestore.firestore()
                                
                                let fireStorePost = ["gorselUrl" : imageUrl, "yorum": self.yorumTextField.text!, "email": Auth.auth().currentUser!.email, "tarih": FieldValue.serverTimestamp() ] as [String : Any]
                                
                                fireStoreDatabase.collection("Post").addDocument(data: fireStorePost) { (error) in
                                    if error != nil {
                                        self.hataMesjiGoster(title: "Hata", message: error?.localizedDescription ?? "Hata Aldınız, Lütfen tekrar deneyiniz!")
                                    }else {
                                        self.imageView.image = UIImage(named: "Ekran Resmi 2025-08-07 15.21.38")
                                        self.yorumTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                                
                                
                            }
                            
                        }
                    }
                  
                }
            }
        }
    }
    
    func hataMesjiGoster(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
