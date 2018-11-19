//
//  TextField.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/18/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import UIKit

class TextField: UIView {

    let textField: UITextField = {
        let textField = UITextField()
        textField.font = Font.ofSize(UIFont.labelFontSize)
        return textField
    }()

    var placeholder: String? {
        get {
            return textField.placeholder
        }
        set(newPlaceholder) {
            textField.placeholder = newPlaceholder
        }
    }

    var textFieldDelegate: UITextFieldDelegate? {
        get {
            return textField.delegate
        }
        set(newDelegate) {
            textField.delegate = newDelegate
        }
    }

    init() {
        super.init(frame: .zero)

        // UI setup
        backgroundColor = .white

        // Subviews
        addSubview(textField)

        // Constraints
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIView Overrides
    override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
}
