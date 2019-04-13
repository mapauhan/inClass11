//
//  UserPhotosViewController.swift
//  inClass11
//
//  Created by Maria Handschu on 4/13/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase

class UserPhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
  
    var imageRef: StorageReference {
        return Storage.storage().reference().child("images")
    
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picCell", for: indexPath)
        
        return cell
    }
    


}
