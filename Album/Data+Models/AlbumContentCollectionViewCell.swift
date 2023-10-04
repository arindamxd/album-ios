//
//  AlbumContentCollectionViewCell.swift
//  Album
//
//  Created by Arindam Karmakar on 05/10/23.
//

import Foundation
import UIKit

class AlbumContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var id: UILabel!
    
    var albumContent: AlbumContent? {
        didSet {
            self.id?.text = "\(albumContent?.id ?? 0)"
        }
    }
}
