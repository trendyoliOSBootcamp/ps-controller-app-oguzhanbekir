//
//  ControllerCollectionViewCell.swift
//  PS Controller App
//
//  Created by Anıl Taşkıran on 30.04.2021.
//

import UIKit

final class ControllerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!

    func configure(image: UIImage?) {
        imageView.image = image
    }
}
