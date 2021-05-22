//
//  ViewController.swift
//  Social Media Templates
//
//  Created by Julian Martinez on 5/21/21.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            
            switch sectionIndex {
            case 0:
                
                let circleSize: CGFloat                 = 70
                
                let itemSize                            = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item                                = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize                           = NSCollectionLayoutSize(widthDimension: .absolute(circleSize), heightDimension: .absolute(circleSize))
                let group                               = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section                             = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior     = .continuous
                section.interGroupSpacing               = 20
                section.contentInsets                   = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 15, trailing: 0)
                
                return section
                
            case 1:
                
                let itemSize                            = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item                                = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize                           = NSCollectionLayoutSize(widthDimension: .absolute(105), heightDimension: .absolute(160))
                let group                               = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section                             = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior     = .continuous
                section.interGroupSpacing               = 55
                section.contentInsets                   = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 0)
                
                return section
                
            case 2:
                let cellSpacing: CGFloat            = 1
                let numberOfColumnsPerRow: CGFloat  = 3
                let fractionalItemWidth            = 1 / numberOfColumnsPerRow - cellSpacing / layoutEnvironment.container.contentSize.width * (2 / numberOfColumnsPerRow)
                let fractionalLargeItemWidth       = 2 / numberOfColumnsPerRow - cellSpacing / layoutEnvironment.container.contentSize.width * (1 / numberOfColumnsPerRow)
                
                print(layoutEnvironment.container.contentSize.width)
                
                let itemSize                                = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item                                    = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let largeItemSize                           = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalLargeItemWidth), heightDimension: .fractionalHeight(1))
                let largeItem                               = NSCollectionLayoutItem(layoutSize: largeItemSize)
                
                
                let singleItemGroupSize                     = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalItemWidth), heightDimension: .fractionalHeight(1))
                let singleItemlGroup                        = NSCollectionLayoutGroup.vertical(layoutSize: singleItemGroupSize, subitem: item, count: 1)
                
                let verticalGroupSize                       = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalItemWidth), heightDimension: .fractionalHeight(1))
                let verticalGroup                           = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitem: item, count: 2)
                verticalGroup.interItemSpacing              = .fixed(cellSpacing)
                
                let numberOfSubgroups: CGFloat              = 13
                let subGroupSize                            = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/numberOfSubgroups))
                
                let threeItemGroup                          = NSCollectionLayoutGroup.horizontal(layoutSize: subGroupSize, subitems: [verticalGroup, largeItem])
                threeItemGroup.interItemSpacing             = .fixed(cellSpacing)
                threeItemGroup.contentInsets                  = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: cellSpacing, trailing: 0)
                
                let fiveItemGroup                           = NSCollectionLayoutGroup.horizontal(layoutSize: subGroupSize, subitems: [singleItemlGroup, verticalGroup, verticalGroup])
                fiveItemGroup.interItemSpacing              = .fixed(cellSpacing)
                fiveItemGroup.contentInsets                  = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: cellSpacing, trailing: 0)
                
                let fiveItemGroupAlternate                  = NSCollectionLayoutGroup.horizontal(layoutSize: subGroupSize, subitems: [verticalGroup, verticalGroup, singleItemlGroup])
                fiveItemGroupAlternate.interItemSpacing     = .fixed(cellSpacing)
                fiveItemGroupAlternate.contentInsets                  = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: cellSpacing, trailing: 0)
                
                let sixItemGroup                            = NSCollectionLayoutGroup.horizontal(layoutSize: subGroupSize, subitems: [verticalGroup, verticalGroup, verticalGroup])
                sixItemGroup.interItemSpacing               = .fixed(cellSpacing)
                sixItemGroup.contentInsets                  = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: cellSpacing, trailing: 0)
                
                
                let overallGroupSize                        = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(numberOfSubgroups * 2 / numberOfColumnsPerRow))
                let overallGroup                            = NSCollectionLayoutGroup.vertical(layoutSize: overallGroupSize, subitems: [
                                                                                                sixItemGroup,
                                                                                                sixItemGroup,
                                                                                                threeItemGroup,
                                                                                                sixItemGroup,
                                                                                                fiveItemGroupAlternate,
                                                                                                sixItemGroup,
                                                                                                fiveItemGroup,
                                                                                                sixItemGroup,
                                                                                                threeItemGroup,
                                                                                                sixItemGroup,
                                                                                                fiveItemGroupAlternate,
                                                                                                sixItemGroup,
                                                                                                fiveItemGroup,
                                                                                                sixItemGroup])
                
                let section                         = NSCollectionLayoutSection(group: overallGroup)
                return section
                
            default:
                print("There was an error creating the collection view layout")
                return nil
            }
        })
        
        return layout
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.register(CircularCollectionViewCell.self, forCellWithReuseIdentifier: "Circular Cell")
        collectionView.register(RoundCornerCollectionViewCell.self, forCellWithReuseIdentifier: "Rounded Square Cell")
        collectionView.register(SquareCollectionViewCell.self, forCellWithReuseIdentifier: "Square Cell")
        
        
        collectionView.dataSource                   = self
        collectionView.backgroundColor              = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Circular Cell", for: indexPath) as! CircularCollectionViewCell
            
            cell.imageView.image = DataModel.images[indexPath.row]
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Rounded Square Cell", for: indexPath) as! RoundCornerCollectionViewCell
            
            cell.imageView.image = DataModel.images[indexPath.row]
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Square Cell", for: indexPath) as! SquareCollectionViewCell
            
            cell.imageView.image = DataModel.images[indexPath.row]
            
            return cell
        default :
            print("An error was entountered while creating collection view cell")
            return UICollectionViewCell()
        }
    }
    
}

