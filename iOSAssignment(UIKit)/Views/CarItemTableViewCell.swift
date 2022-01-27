//
//  CarItemTableViewCell.swift
//  iOSAssignment(UIKit)
//
//  Created by Alex Yang on 2022-01-27.
//

import UIKit

class CarItemTableViewCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secLabel: UILabel!
    
    var phoneNumber: String? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func phoneCall(_ sender: Any) {
        if let phoneNumber = phoneNumber {
            let telephone = "tel://\(phoneNumber)"
            guard let url = URL(string: telephone) else { return }
            UIApplication.shared.open(url)
        }
    }
}
