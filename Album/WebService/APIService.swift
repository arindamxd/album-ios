//
//  APIService.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
    private let albumsURL = "https://jsonplaceholder.typicode.com/albums"
    private let albumContentURL = "https://jsonplaceholder.typicode.com/photos"
    
    func getAlbums(
        success: @escaping ([Album]) -> Void,
        failure: @escaping (String) -> Void
    ) {
        URLSession.shared.dataTask(with: URL(string: albumsURL)!) { (data, urlResponse, error) in
            if let error = error {
                failure(error.localizedDescription)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let albumsData = try jsonDecoder.decode([Album].self, from: data)
                    success(albumsData)
                } catch {
                    failure(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getAlbumContent(
        albumId: Int,
        success: @escaping ([AlbumContent]) -> Void,
        failure: @escaping (String) -> Void
    ) {
        var url = URL(string: albumContentURL)!
        url.append(queryItems: [URLQueryItem(name: "albumId", value: "\(albumId)")])
        
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                failure(error.localizedDescription)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let albumsData = try jsonDecoder.decode([AlbumContent].self, from: data)
                    success(albumsData)
                } catch {
                    failure(error.localizedDescription)
                }
            }
        }.resume()
    }
}
