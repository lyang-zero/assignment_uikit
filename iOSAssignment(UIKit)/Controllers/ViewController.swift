//
//  ViewController.swift
//  iOSAssignment(UIKit)
//
//  Created by Alex Yang on 2022-01-26.
//

import UIKit

class ViewController: UIViewController {
    
    private var items: [CarListItem] = .init() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCars()
    }


    private func fetchCars() {
        Task {
            if let result = try? await CarFetcher.fetchCars() {
                DispatchQueue.main.async {
                    self.items = result
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath) as! CarItemTableViewCell
        let item = items[indexPath.row]
        cell.firstLabel.text = "\(String(item.year)) \(item.make) \(item.model) \(item.trim)"
        cell.secLabel.text = "$\(Int(item.listPrice)) | \(item.mileageStr) Mi | \(item.dealer.city),\(item.dealer.state)"
        cell.phoneNumber = item.dealer.phone
        
        if let url = item.listingImageUrl {
            cell.customImageView.load(url: url)
            cell.customImageView.layer.cornerRadius = 6
            cell.customImageView.clipsToBounds = true
        }
        
        return cell
    }
}

