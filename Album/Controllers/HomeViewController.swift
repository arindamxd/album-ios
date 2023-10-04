//
//  ViewController.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel!
    private var albumDataSource: CollectionViewDataSource<AlbumCollectionViewCell, Album>!
    private var albumContentDataSource: CollectionViewDataSource<AlbumContentCollectionViewCell, AlbumContent>!
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
    @IBOutlet weak var albumContentCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
    }
    
    func observeViewModel() {
        self.viewModel = HomeViewModel()
        self.viewModel.observeAlbums = { self.updateAlbumDataSource() }
        self.viewModel.observeAlbumContent = { self.updateAlbumContentDataSource() }
    }
    
    func updateAlbumDataSource() {
        self.albumDataSource = CollectionViewDataSource(
            cellIdentifier: "AlbumCollectionViewCell",
            items: self.viewModel.albums,
            configureCell: { (cell, model) in
                cell.album = model
            }, selected: { index in
                self.viewModel.currentAlbumId = self.viewModel.albums[index].id
            }
        )
        
        DispatchQueue.main.async {
            self.albumCollectionView.delegate = self.albumDataSource
            self.albumCollectionView.dataSource = self.albumDataSource
            self.albumCollectionView.reloadData()
        }
    }
    
    func updateAlbumContentDataSource() {
        self.albumContentDataSource = CollectionViewDataSource(
            cellIdentifier: "AlbumContentCollectionViewCell",
            items: self.viewModel.albumContent,
            configureCell: { (cell, model) in
                cell.albumContent = model
            }, selected: { index in
                print("selected : \(index)")
            }
        )
        
        DispatchQueue.main.async {
            self.albumContentCollectionView.delegate = self.albumContentDataSource
            self.albumContentCollectionView.dataSource = self.albumContentDataSource
            self.albumContentCollectionView.reloadData()
        }
    }
}
