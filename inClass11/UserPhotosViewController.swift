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
    
 
    @IBOutlet weak var chosenPhoto: UIImageView!
    
    
     var photoPicker = UIImagePickerController()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testLabel: UICollectionView!
    
    let filename = Auth.auth().currentUser?.uid


    override func viewDidLoad() {
        super.viewDidLoad()
        
       let storage = Storage.storage()
       let storageRef = storage.reference()
        let childRef = storageRef.child("/inClass11/\(Auth.auth().currentUser?.email)")
        let photoData = StorageMetadata()
        photoData.contentType = "images/jpeg"



    }
    
    @IBAction func addClicked(_ sender: Any) {
        
        photoPicker.delegate = self
        photoPicker.sourceType = .photoLibrary
        // photoPicker.mediaTypes = [".jpeg"]
        
        self.present(photoPicker, animated: true, completion: nil)
        
//        let image = chosenPhoto.image
//        let imageData = UIImage.jpegData(image!)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picCell", for: indexPath)
            let userImg = UIImage().jpegData(compressionQuality: 1)
      //  cell.viewWithTag(100) as! UILabel
        
        return cell
    }
    
}

extension UserPhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] != nil {
            print(info)
            
        }

    }
}

