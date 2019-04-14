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
    
    
   // @IBOutlet weak var chosenPhoto: UIImageView!
    var emptyArray: [NSData] = []
  

    var photoPicker = UIImagePickerController()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testLabel: UICollectionView!
    
    let filename = Auth.auth().currentUser?.uid
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        if ((info[.originalImage] as? UIImage) != nil) {
            print(info)
            
            let storage = Storage.storage().reference()
           // let childRef = storage.child("inClass11/\(Auth.auth().currentUser?.email)")
            let childRef = storage.child("/inClass11/m.h@gmail.com/sunset2.jpeg")
            
            if let data = info[.originalImage] {
            let photoData: NSData = (data as! UIImage).jpegData(compressionQuality: 1)! as NSData
            emptyArray.append(photoData)
            print("empty array\(emptyArray)")
            
            let metadata = StorageMetadata()
                //verifies that a jpeg is uploaded to Firebase
                metadata.contentType = "image/jpeg"
            let uploadTask = childRef.putData((emptyArray[0] as? Data)!, metadata: metadata) { (metadata, error) in
                guard let metadata = metadata else { return }
                
                
                let size = metadata.size
                childRef.downloadURL { (url, error) in
                    guard let downloadURL = url else { return }
                   
                    
                }
            }
        }
            
            // uploadTask.resume()
            
    }
        
       
        dismiss(animated: true, completion: nil)
        
    }
}

