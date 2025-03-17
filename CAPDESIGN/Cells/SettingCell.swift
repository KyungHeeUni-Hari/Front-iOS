//
//  SettingCell.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/14/25.
//


import UIKit
class SettingCell : UICollectionViewCell {
    
    static let identifier = "SettingCell"
    
    let SettingTitle : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "설정"
        label.font = .customFont(font: .SFPro, ofSize: 16,rawValue : 700)
        label.textAlignment = .center
       return label
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
        addSubview(SettingTitle)
        
    }
    private func setupConstraints(){
        SettingTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(contentView).offset(20)     }
        
        
    }
    func configure(with text: String) {
           SettingTitle.text = text
       }
}
