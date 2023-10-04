//
//  AlbumCollectionViewCell.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation
import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var title: UILabel!
    
    var album: Album? {
        didSet {
            self.title?.text = album?.title
        }
    }
}
