//
//  configureDocumentView.swift
//  XavierApp
//
//  Created by Eric Li on 7/20/20.
//
import UIKit
import VisionKit

class ViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    private func configureDocumentView(){
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true, completion: nil)
    }
}

    extension ViewController:VNDocumentCameraViewController{
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan){
            for pageNumber in 0..<scan.pageCount{
                let image = scan.imageOfPage(at: pageNumber)
                
                print(image)
            }
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    

