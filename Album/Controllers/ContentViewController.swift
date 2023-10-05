//
//  ContentViewController.swift
//  Album
//
//  Created by Arindam Karmakar on 05/10/23.
//

import UIKit

class ContentViewController: UIViewController {
    
    internal var _imageUrl: String = ""
    internal var _description: String = ""
    
    @IBOutlet weak var iamgeImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.iamgeImageView.sd_setImage(with: URL(string: _imageUrl))
        self.descriptionLabel.text = self._description
    }
}
