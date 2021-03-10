//
//  ViewController.swift
//  TP01_BlueTeam
//
//  Created by Cosgrave, Kaleb on 3/5/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ImgView1: UIImageView!
    
    @IBOutlet weak var ImgView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func greyscaleBtn(_ sender: UIButton) {
        //Tristan
        let image = CIImage(image: ImgView1.image!)
        
        let filter = CIFilter(name: "CIColorMonochrome", parameters:
                                [   "inputColor": (CIColor(red: 0.7, green: 0.7, blue: 0.7)),
                                    "inputImage": image!,
                                    "inputIntensity": 1.0
                            ])
        let outputImage = filter?.outputImage
        ImgView2.image = UIImage(ciImage: outputImage!)
    }
    
    @IBAction func sepiaBtn(_ sender: UIButton) {
        //Milan
        let image = CIImage(image: ImgView1.image!)
        
        let filter = CIFilter(name: "CISepiaTone", parameters: ["inputImage": image!, "inputIntensity": 1.0])
        
        let outputImage = filter?.outputImage
        
        ImgView2.image = UIImage(ciImage: outputImage!)
        
    }
    
    
    @IBAction func gaussBtn(_ sender: UIButton) {
        //Kaleb
        let image = CIImage(image: ImgView1.image!)
        
        let filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputImage": image!, "inputRadius": 15])
        
        let outputImage = filter?.outputImage
        
        ImgView2.image = UIImage(ciImage: outputImage!)
    }
    
    @IBAction func changeImageBtn(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let
                image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        else {
            return
        }
        ImgView1.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
}

