//
//  CountryCollectionViewCell.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/18/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import UIKit

import SnapKit

class CountryCollectionViewCell: UICollectionViewCell {

    public let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Font.ofSize(26)
        return label
    }()

    static func heightForText(_ text: String, width: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.font = Font.ofSize(26)
        label.text = text

        label.sizeToFit()

        return label.frame.height + 40.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(title)

        title.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
