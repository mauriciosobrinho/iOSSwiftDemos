//
//  ViewController.swift
//  CameraAppDemo
//
//  Created by Mauricio Luiz Sobrinho on 17/05/17.
//  Copyright © 2017 Mauricio Luiz Sobrinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
            UIImagePickerControllerDelegate,
              UINavigationControllerDelegate{

    @IBOutlet weak var MyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func CameraAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func PhotosAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            MyImageView.image = image
            MyImageView.contentMode = .scaleAspectFit
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func SaveAction(_ sender: Any) {
        let imageData = UIImageJPEGRepresentation(MyImageView.image!, 0.6)
        let compressImage = UIImage(data:imageData!)
        UIImageWriteToSavedPhotosAlbum(compressImage!, nil, nil, nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

