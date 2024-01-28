//
//  NetworkManager.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/16.
//

import Foundation

enum NetworkError : Error {
    case networkingErr
    case dataErr
    case parseErr
}

final class NetworkManager{
    static let shared = NetworkManager()
    private init() {}
    
    typealias NetworkCompletion = (Result<[Music], NetworkError>) -> Void
    
    func fetchMusic(searchTerm : String, completion : @escaping NetworkCompletion ){
        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
        
        performRequest(with : urlString) { result in
            completion(result)
        }
    }
    
    
    private func performRequest(with urlString : String, completion : @escaping NetworkCompletion){
        guard let url = URL(string : urlString) else { return }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, resp, err in
            if(err != nil) {
                completion(.failure(.networkingErr))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dataErr))
                return
                
            }
            
            if let musics = self.parseJSON(data : safeData){
                completion(.success(musics))
            } else {
                completion(.failure(.parseErr))
            }
            
        }
        task.resume()
        
    }
    
    private func parseJSON( data : Data) -> [Music]?{
        do {
            let data = try JSONDecoder().decode(MusicData.self , from: data)
            return data.results
        } catch {
            
            return nil
        }
    }
}
