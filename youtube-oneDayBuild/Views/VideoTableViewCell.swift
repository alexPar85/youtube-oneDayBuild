//
//  VideoTableViewCell.swift
//  youtube-oneDayBuild
//
//  Created by mac on 2/12/20.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video : Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell (_ v:Video?){
        
        self.video = v
        
        // Ensure that I have a video
        guard video != nil else{
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video?.thumbnail != "" else {
            return
    }
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // Set the tumbnail imageView
            thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
            
        let url = URL( string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask (with: url!) { (data, response, error) in
            
            // Save the data in the cache
            CacheManager.setVideoCache(url!.absoluteString, data: data)
            
            if error == nil && data != nil {
                
                // Check that the dowloaded URL matches the video thumbnail that this cell is currently set to display
                
                if url?.absoluteString != self.video?.thumbnail {
                    
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        // Start the dataTask
        dataTask.resume()
    }
}
