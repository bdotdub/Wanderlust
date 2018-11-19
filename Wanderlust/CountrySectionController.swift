//
//  CountrySectionController.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/18/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import IGListKit

class CountrySectionController: ListSectionController {

    private var country: Country?

    override func didUpdate(to object: Any) {
        if let country = object as? Country {
            self.country = country
        }
    }

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let width = self.collectionContext!.containerSize.width
        return CGSize(width: width,
                      height: CountryCollectionViewCell.heightForText(country!.name.common, width: width))
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext!.dequeueReusableCell(of: CountryCollectionViewCell.self,
                                                                     for: self,
                                                                     at: index) as? CountryCollectionViewCell else {
            fatalError()
        }
        cell.title.text = country?.name.common
        return cell
    }

}
