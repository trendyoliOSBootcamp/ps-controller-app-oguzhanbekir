//
//  ViewController.swift
//  PS Controller App
//
//  Created by Anıl Taşkıran on 30.04.2021.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var basketButton: UIButton!
    @IBOutlet private weak var controllerTabView: UIView!
    @IBOutlet private weak var devicesTabView: UIView!
    @IBOutlet private weak var mousesTabView: UIView!

    let products: [Product] = [.init(image: UIImage(named: "blackPSController")),
                               .init(image: UIImage(named: "blackPSController")),
                               .init(image: UIImage(named: "whitePSController"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(.init(nibName: "ControllerCollectionViewCell",
                                      bundle: .main),
                                forCellWithReuseIdentifier: "psControllerIdentifier")
    }

    @IBAction private func basketButtonTapped() {
        print("basket button tapped")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "psControllerIdentifier", for: indexPath) as? ControllerCollectionViewCell else { return .init() }
        let product = products[indexPath.item]
        cell.configure(image: product.image)
        return cell
    }
}

extension UIViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 28 + x + 24 + x. 0.3982 = collectionViewWidth
        let cellWidth = (collectionView.frame.width - 28 - 24) / 1.3982
        // ratio w/h 231.0 / 291.0
        print(cellWidth)
        return .init(width: cellWidth, height: cellWidth / 0.7938)
//        return .init(width: cellWidth, height: 300)
    }
}


extension UIViewController: UICollectionViewDelegate {

}
