//
//  ViewController.swift
//  Login
//
//  Created by Marlon Escobar on 2019-03-27.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var paswwordTextField: UITextField!
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    

    var images:[UIImage] = [UIImage(named: "user.png")!,
                              UIImage(named: "admin.png")!]
    
    struct profile {
        var userName = ""
        var password = ""
        var image = UIImage()
    }
    var marlon:profile = profile()
    var admin:profile = profile()
    var profiles:[profile] = [profile]()
    var name:String = ""
    var pass:String = ""
    var newUser:profile = profile()
    var photo = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        marlon = profile(userName: "marlon", password: "12345", image: images[0])
        admin = profile(userName: "admin", password: "54321", image: images[1])
        
        profiles = [marlon,admin]
        
        paswwordTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        paswwordTextField.resignFirstResponder()
        return true
    }
    
//    func textFieldDidEndEditing(_ userName: String,_ password: String,_ imageUser: UIImageView) {
//
//    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        userLogIn(logInButton)
    }
    
    
    func textCredential(){
        for i in profiles{
//            user = userNameTextField.text
            if (userNameTextField.text == i.userName && paswwordTextField.text == i.password){
                userPhotoImageView.image = i.image
            }else{
                print("ok, go ahead")
            }
        }
        
    }
    
    
    
    @IBAction func userLogIn(_ sender: UIButton) {
        for i in profiles{
            //            user = userNameTextField.text
            if (userNameTextField.text == i.userName && paswwordTextField.text == i.password){
                userPhotoImageView.image = i.image
            }else{
                userPhotoImageView.image = UIImage(named: "defaultphoto_2x")
            }
        }
        
    }
    
    
//    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        paswwordTextField.resignFirstResponder()
//        return true
//    }
    
    @IBAction func selectImage2(_ sender: UITapGestureRecognizer) {
        paswwordTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func userSignIn(_ sender: UIButton) {
        name = userNameTextField.text ?? "null"
        pass = paswwordTextField.text ?? "null"
        photo = (userPhotoImageView.image ?? nil) ?? images[0]
        newUser = profile(userName:name , password: pass, image: photo)
        profiles.append(newUser)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else{
                fatalError("Image cannot be loaded: \(info)")
        }
        userPhotoImageView.image = selectedImage //setImage(selectedImage)
        dismiss(animated: true, completion: nil)
        
    }

}

