//
//  HomeCell.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/14/25.
//

import UIKit

class HomeCell : UICollectionViewCell  {
    
    static let identifier = "HomeCell"
    
    lazy var HomeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
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
    addSubview(HomeImage)
}
private func setupConstraints(){
    
    HomeImage.snp.makeConstraints { make in
        make.top.equalTo(contentView).offset(5)
        make.leading.equalTo(contentView).offset(20) }
    
}
   

}
