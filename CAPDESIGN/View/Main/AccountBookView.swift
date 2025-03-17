//
//  AccountBookView.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/17/25.
//

import UIKit
import Then
class AccountBookView: UIView {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    lazy var moneyField = UITextField().then {make in
        make.borderStyle = .roundedRect
               make.layer.cornerRadius = 8
               make.clipsToBounds = true
        make.font = UIFont.systemFont(ofSize: 16)
        make.textColor = .black
        make.backgroundColor = .clear
        
    }
  
    
    let incomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("수입", for: .normal)
        return button
    }()
    
    let expenseButton : UIButton = {
        let button = UIButton (type: .system)
        button.setTitle("지출", for: .normal)
        return button
    }()
    
    lazy var inoutStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.addArrangedSubview(incomeButton)
        stackview.addArrangedSubview(expenseButton)
        return stackview
    }()
    
    let wonsign : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "won")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
       return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.8) // 반투명 배경
        addSubview(dateLabel)
        addSubview(incomeButton)
        addSubview(expenseButton)
        addSubview(inoutStackView)
        addSubview(moneyField)
        addSubview(wonsign)
    }
    
    private func setupConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            
            
        }
        wonsign.snp.makeConstraints{ make in
            make.top.equalTo(dateLabel).offset(10)
            make.leading.equalTo(dateLabel)
            make.width.height.equalTo(20)
        }
        moneyField.snp.makeConstraints{make in
            make.top.equalTo(dateLabel).offset(10)
            make.leading.equalTo(wonsign).offset(20)
        }
        inoutStackView.snp.makeConstraints { make in
            make.top.equalTo(wonsign).offset(25)
            make.leading.equalTo(wonsign)
            
        }
        
        
    }
}
