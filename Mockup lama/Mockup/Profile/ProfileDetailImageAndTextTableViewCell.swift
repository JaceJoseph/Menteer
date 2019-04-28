//
//  ProfileDetailImageAndTextTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 25/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ProfileDetailImageAndTextTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var textDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(data:User.textWithIcon){
        imageIcon.image=data.icon
        textDescriptionLabel.text = data.text
    }
    
}
