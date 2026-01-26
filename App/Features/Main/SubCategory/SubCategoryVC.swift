//
//  SubCategoryVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 25/1/26.
//

import UIKit

final class SubCategoryVC: BaseVC<SubCategoryCV, SubCategoryVM> {
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        contentView.navigationBar.titleLabel.text = text
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
    }
    
    private func setupTable() {
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension SubCategoryVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SubCategoryCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.model[indexPath.row])
        return cell
    }
}
