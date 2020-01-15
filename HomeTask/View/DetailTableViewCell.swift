//
//  DetailTableViewCell.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {

    let titleLabel: UILabel = UILabel()
    let detailLabel: UILabel = UILabel()
    let customImageView: UIImageView = UIImageView()
    
    static func reuseId() -> String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        detailLabel.text = nil
        customImageView.image = UIImage()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        customImageView.contentMode = .scaleAspectFit
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customImageView)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.contentMode = .left
        titleLabel.numberOfLines = 1
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        detailLabel.contentMode = .left
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailLabel)
        
        self.selectionStyle = .none
        setConstraints()
    }

    private func setConstraints() {
        customImageView.snp.makeConstraints { make -> Void in
            make.top.equalTo(contentView).offset(8)
            make.bottom.lessThanOrEqualTo(contentView).offset(-8)
            make.left.equalTo(contentView).offset(10)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(customImageView.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(detailLabel.snp.top).offset(-10)
        }
        
        detailLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(customImageView.snp.right).offset(10)
            make.bottom.lessThanOrEqualTo(contentView).offset(-8)
            make.right.equalTo(contentView).offset(-10)
        }
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
}
