//
//  APIService.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
    private var albumsURL = URL(string: "https://jsonplaceholder.typicode.com/albums")!
    private var albumDataURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    
    func getAlbums(
        success: @escaping ([Album]) -> Void,
        failure: @escaping (String) -> Void
    ) {
        URLSession.shared.dataTask(with: albumsURL) { (data, urlResponse, error) in
            if let error = error {
                failure(error.localizedDescription)
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let albumsData = try jsonDecoder.decode([Album].self, from: data)
                    success(albumsData)
                } catch {
                    print("Unexpected error: \(error)")
                    failure(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getAlbumData(
        albumId: String,
        success: @escaping ([AlbumData]) -> Void,
        failure: @escaping (String) -> Void
    ) {
        albumDataURL.append(queryItems: [URLQueryItem(name: "albumId", value: albumId)])
        
        URLSession.shared.dataTask(with: albumDataURL) { (data, urlResponse, error) in
            if let error = error {
                failure(error.localizedDescription)
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let albumsData = try jsonDecoder.decode([AlbumData].self, from: data)
                    success(albumsData)
                } catch {
                    print("Unexpected error: \(error)")
                    failure(error.localizedDescription)
                }
            }
        }.resume()
    }
}
