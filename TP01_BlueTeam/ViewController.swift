//
//  ViewController.swift
//  TP01_BlueTeam
//
//  Created by Cosgrave, Kaleb on 3/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImgView1: UIImageView!
    
    @IBOutlet weak var ImgView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func greyscaleBtn(_ sender: UIButton) {
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
    }
    
    
    @IBAction func gaussBtn(_ sender: UIButton) {
    }
}

