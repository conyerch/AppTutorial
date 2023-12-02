//
//  Model.Swift
//  App3
//
//  Created by christopher conyersIV on 12/1/23.
//

import Foundation

protocol modelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: modelDelegate?
    
    func getVideos() {
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: data!)
                
                DispatchQueue.main.sync {
                    
                    if response.items != nil {
                        
                        self.delegate?.videosFetched(response.items!)
                        
                    }
                }
                
                dump(response)
                
            }
            
            catch {
                print("error recieved")
                
            }

        }
        
        dataTask.resume()
            
        }
    }

