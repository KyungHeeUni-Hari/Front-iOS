//
//  PredictionCell.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/14/25.
//

import UIKit
class PredictionCell : UICollectionViewCell {
    
    static let identifier = "PredictionCell"
    
    lazy var PredictionImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "prediction")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = .white
           setupViews()
           setupConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    private func setupViews(){
        addSubview(PredictionImage)
    }
    private func setupConstraints(){
        PredictionImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
        make.leading.equalTo(contentView).offset(20)
        }
    }
  
}
