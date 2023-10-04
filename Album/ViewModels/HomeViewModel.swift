//
//  HomeViewModel.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation

class HomeViewModel: NSObject {
    
    private var apiService: APIService!
    private var currentAlbumId: String!
    
    private(set) var albums : [Album]! {
        didSet {
            self.bindHomeViewModelToController()
        }
    }
    
    var bindHomeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
        self.apiService = APIService()
        self.currentAlbumId = "-1"
        
        getAlbums()
    }
    
    func getAlbums() {
        self.apiService.getAlbums(success: { data in
            self.albums = data
        }, failure: { error in
            print(error)
        })
    }
    
    func getAlbumData() {
        self.apiService.getAlbumData(albumId: self.currentAlbumId, success: { data in
            print(data)
        }, failure: { error in
            print(error)
        })
    }
}
