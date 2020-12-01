//
//  LandingPageExtensions.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

extension LandingPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView,
            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegisteredCells.cellId, for: indexPath) as! LandingPageCellView
        let page = pages[indexPath.item]
        cell.collectionViewPage = page
        return cell
    }
}

extension LandingPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
