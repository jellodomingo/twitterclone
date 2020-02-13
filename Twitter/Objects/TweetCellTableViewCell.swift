//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Angelo Domingo on 2/4/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var rtButton: UIButton!
    
    var liked: Bool = false
    var retweeted: Bool = false
    var tweetId: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setRetweet(_ isRetweet: Bool)
    {
        retweeted = isRetweet
        if(retweeted) {
            rtButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        } else {
            rtButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        let tobeRetweet = !retweeted
        if(tobeRetweet) {
            TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success:
                    {
                        self.setRetweet(true)
                }, failure: { (error) in
                    print("Retweet did not succeed: \(error)")
                })
            }
            else{
                TwitterAPICaller.client?.unretweetTweet(tweetId: tweetId, success:
                    {
                        self.setRetweet(false)
                }, failure: { (error) in
                    print("Unretweet did not succeed: \(error)")
                })
        }
    }
    
    func setLiked(_ isLiked: Bool)
    {
        liked = isLiked
        if(liked) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func likeTweet(_ sender: Any) {
        let tobeLiked = !liked
        if(tobeLiked) {
            TwitterAPICaller.client?.likeTweet(tweetId: tweetId, success:
                {
                    self.setLiked(true)
            }, failure: { (error) in
                print("Like did not succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unlikeTweet(tweetId: tweetId, success:
                {
                    self.setLiked(false)
            }, failure: { (error) in
                print("Unlike did not succeed: \(error)")
            })
        }
    }
}
