//
//  Webservice.swift
//  HaberProjesi
//
//  Created by Özlem CİHAN on 20.08.2025.
//

import Foundation

//Haberleri indir gibi bir fonksiyon oluşturcağım aslında, ve de internete gidip veri çekme işlemini yapıcak aslında

class Webservice {
    
    func haberleriIndir(url : URL, completion : @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                }
            }
        }.resume()
    }
}
