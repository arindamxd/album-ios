//
//  AlbumContentCollectionViewCell.swift
//  Album
//
//  Created by Arindam Karmakar on 05/10/23.
//

import Foundation
import SDWebImage

class AlbumContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var thumbnail: UIImageView!
    
    var albumContent: AlbumContent? {
        didSet {
            if let url = URL(string: albumContent?.thumbnailUrl ?? "") {
                self.thumbnail.sd_setImage(with: url)
            }
        }
    }
}
