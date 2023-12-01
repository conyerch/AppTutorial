//
//  Video.Swift
//  App3
//
//  Created by christopher conyersIV on 12/1/23.
//

import Foundation


struct Video: Decodable {
    
    var videoID = ""
    var description = ""
    var title = ""
    var thumb = ""
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceID
        
        case videoID = "videoID"
        case description = "description"
        case title = "title"
        case thumb = "url"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snip = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title
        
        self.title = try snip.decode(String.self, forKey: .title)
        
        // parse decsription
        
        self.description = try snip.decode(String.self, forKey: .description)
        
        // get thumbnail container
        
        let thumbContainer = try snip.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highC = try thumbContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        // parse thumbnail
        
        self.thumb = try highC.decode(String.self, forKey: .thumb)
        
        // get videoID container
        
        let vidC = try snip.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceID)
        
        self.videoID = try vidC.decode(String.self, forKey: .videoID)
        
    }
    

}
