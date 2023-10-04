//
//  ViewController.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel!
    private var dataSource: AlbumCollectionViewDataSource<AlbumCollectionViewCell, Album>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
    }
    
    func initViewModel() {
        self.viewModel = HomeViewModel()
        self.viewModel.bindHomeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.dataSource = AlbumCollectionViewDataSource(
            cellIdentifier: "AlbumCollectionViewCell",
            items: self.viewModel.albums,
            configureCell: { (cell, evm) in
                cell.album = evm
            }, selected: { index in
                print("selected : \(index)")
            }
        )
        
        DispatchQueue.main.async {
            self.collectionView.delegate = self.dataSource
            self.collectionView.dataSource = self.dataSource
            self.collectionView.reloadData()
        }
    }
}
