//
//  ConnectTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 23/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

protocol  ConnectCellDelegate {
    func didTapRequestButton()
    func didTapStartChatButton(name:String)
}

class ConnectTableViewCell: UITableViewCell {
    
    var delegate:ConnectCellDelegate?
    var user:User!
    
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    override func awakeFromNib() {
        connectButton.layer.cornerRadius = 10
        chatButton.layer.cornerRadius = 10
        super.awakeFromNib()
        // Initialization code
    }

//    @IBAction func connectButtonPushed(_ sender: Any) {
//    }
    
    func createCell(person:User){
        
        user = person
        
        if person.jobExperience.isEmpty{
            jobLabel.text = "Currently Unemployed"
        }else{
            jobLabel.text = person.jobExperience.last?.text
        }
        
        nameLabel.text = person.name
        if let personMaterial = person.material {
            interestLabel.text = personMaterial
        }else{
            interestLabel.isHidden = true
        }
        
        personImage.image = person.Image
        
    }
    
    @IBAction func tapRequestButton(_ sender: UIButton) {
        delegate?.didTapRequestButton()
        connectButton.setTitle("Requested", for: .normal)
        connectButton.tintColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
        connectButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @IBAction func tapChatButton(_ sender: UIButton) {
        delegate?.didTapStartChatButton(name:user.name)
        
    }
}
