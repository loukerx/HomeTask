//
//  MainViewController.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UITableViewController {
    
    private var details: [Detail]?
    private var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCanadaDetails()
    }
    
    private func setupUI() {
        refreshControl = UIRefreshControl()
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl!.addTarget(self, action: #selector(refreshCanadaData(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl!)
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.reuseId())
    }
    
    @objc private func refreshCanadaData(_ sender: Any) {
        viewModel.fetchCanadaDetails()
    }
    
    // MARK: Config View Model
     private func configViewModel() {
         viewModel = MainViewModel(DataStore())
         viewModel.updatedUI = { [weak self] response, error in
             guard let self = self else { return }
             if let error = error {
                 self.showAlert(nil, error.errorDescription)
             }
             if let response = response {
                self.title = response.title
                if let details = response.details {
                    self.details = details.filter { $0.title != nil }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
             }
         }
     }
 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:  DetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseId(), for: indexPath) as! DetailTableViewCell
        
        if let detail = details?[indexPath.row] {
            cell.titleLabel.text = detail.title
            cell.detailLabel.text = detail.description
            cell.customImageView.kf.setImage(with: detail.imageURL)
        }
        
        return cell
    }
}
