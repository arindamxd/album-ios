//
//  HomeViewModel.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation

class HomeViewModel: NSObject {
    
    private var apiService: APIService!
    
    private (set) var albums : [Album]! {
        didSet {
            self.observeAlbums()
        }
    }
    
    private (set) var albumContent : [AlbumContent]! {
        didSet {
            self.observeAlbumContent()
        }
    }
    
    var currentAlbumId: Int! {
        didSet {
            self.getAlbumData(albumId: currentAlbumId)
        }
    }
    
    var observeAlbums: (() -> ()) = {}
    var observeAlbumContent: (() -> ()) = {}
    
    override init() {
        super.init()
        
        self.apiService = APIService()
        self.currentAlbumId = -1
        
        getAlbums()
    }
    
    private func getAlbums() {
        self.apiService.getAlbums(success: { data in
            self.albums = data
        }, failure: { error in
            print(error)
        })
    }
    
    private func getAlbumData(albumId: Int) {
        self.apiService.getAlbumContent(albumId: albumId, success: { data in
            self.albumContent = data
        }, failure: { error in
            print(error)
        })
    }
}
