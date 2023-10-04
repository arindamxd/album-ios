//
//  AlbumCollectionViewDataSource.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation
import UIKit

class AlbumCollectionViewDataSource<CELL: UICollectionViewCell, T>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var cellIdentifier: String!
    private var items: [T]!
    
    var configureCell: (CELL, T) -> () = { _,_ in }
    var selected: (Int) -> () = { _ in }
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> (), selected: @escaping (Int) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        self.selected = selected
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selected(indexPath.row)
    }
}
