//
//  PhotoCell.swift
//  FotoFigurkiRu
//
//  Created by Maxim Kosoy on 25.06.2020.
//  Copyright © 2020 Maxim Kosoy. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("Запущен файл отдельных ячеек")
    }
    
    func setupCell(image:UIImage){
        print("Вызвана функция установки изображения в ячейку")
        self.photoImage.image = image
    }

}
