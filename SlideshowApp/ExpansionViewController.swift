//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 伊藤嵩 on 2019/11/26.
//  Copyright © 2019 Shu Ito. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    @IBOutlet weak var imagesView: UIImageView!
    
    var expansionImage : UIImage!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagesView.image = expansionImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
