//
//  ViewController.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/17/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import UIKit

import IGListKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate, ListAdapterDataSource {

    lazy var listAdapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    let searchTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Filter"
        return textField
    }()

    private var countries: [Country]?

    private var filteredCountries: [Country]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Subviews
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.searchTextField)

        if let fileURL = Bundle.main.url(forResource: "countries", withExtension: "json") {
            do {
                let contents = try Data(contentsOf: fileURL)
                self.countries = try? JSONDecoder().decode(Countries.self, from: contents)
            } catch {
                // contents could not be loaded
            }
        }

        filteredCountries = countries

        // View setup
        self.view.backgroundColor = .white
        self.collectionView.backgroundColor = .white

        // List setup
        view.addSubview(collectionView)
        listAdapter.collectionView = self.collectionView
        listAdapter.dataSource = self

        // Search bar setup
        searchTextField.textField.addTarget(self,
                                            action: #selector(textFieldDidChange(textField:)),
                                            for: .editingChanged)

        // Gesture Recognizers
        collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(didTapCollectionView(sender:))))

        // Constraints
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(71)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    // MARK: Handlers

    @objc func didTapCollectionView(sender: UITapGestureRecognizer) {
        searchTextField.resignFirstResponder()
    }

    // MARK: ListAdapterDataSource

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.filteredCountries ?? []
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CountrySectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

    // MARK: UITextViewDelegate

    @objc func textFieldDidChange(textField: UITextField) {
        if let text = textField.text, text.count > 0 {
            filteredCountries = countries?.filter { country in
                return country.name.common.localizedCaseInsensitiveContains(text)
            }
        } else {
            filteredCountries = countries
        }
        listAdapter.performUpdates(animated: false, completion: nil)
    }
}
