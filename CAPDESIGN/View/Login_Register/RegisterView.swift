////
////  RegisterView.swift
////  CAPDESIGN
////
////  Created by 손현빈 on 3/6/25.
////
//
//import UIKit
//import SnapKit
//import Then
//
//class RegisterView: UIView {
//
//    // 회원가입 타이틀
//    lazy var titleLabel = UILabel().then { make in
//        make.textColor = .white
//        make.text = "회원가입"
//        make.font = .customFont(font: .SFPro, ofSize: 16,rawValue : 700)
//        make.textAlignment = .center
//    }
//    lazy var leftArrowButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "left"), for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//    // 오른쪽 화살표 버튼
//    lazy var rightArrowButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//    lazy var appImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "AppLOGO") // 앱 로고 이미지 설정
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    lazy var progress1: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "progress1")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    // 페이지 인디케이터
//    lazy var pageIndicator: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 8
//
//        for i in 0..<5 {
//            let dot = UIView()
//            dot.backgroundColor = i == 0 ? .white : .darkGray
//            dot.layer.cornerRadius = i == 0 ? 4 : 4
//            dot.snp.makeConstraints { make in
//                if i == 0 {
//                    make.width.equalTo(16) // 현재 위치를 나타내는 긴 점
//                } else {
//                    make.width.equalTo(8)
//                }
//                make.height.equalTo(8)
//            }
//            stackView.addArrangedSubview(dot)
//        }
//        return stackView
//    }()
//
//    // 이메일 입력 섹션
//    lazy var instructionLabel = UILabel().then { make in
//        make.textColor = .white
//        make.text = "이메일 주소를 입력해주세요"
//        make.font = .customFont(font: .SFPro, ofSize: 21,rawValue : 700)
//         make.textAlignment = .center
//    }
//
//    lazy var emailField = UITextField().then { make in
//        make.placeholder = "이메일"
//        make.borderStyle = .roundedRect
//        make.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        make.backgroundColor = UIColor(white: 0.2, alpha: 1)
//        make.textColor = .black
//        make.attributedPlaceholder = NSAttributedString(
//            string: "이메일",
//            attributes: [.foregroundColor: UIColor.lightGray]
//        )
//    }
//
//    lazy var errorLabel = UILabel().then { make in
//        make.textColor = .red
//        make.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//      
//        make.text = "올바르지 않은 형식의 이메일입니다."
//        make.isHidden = true
//    }
//
//    lazy var successLabel = UILabel().then { make in
//        make.textColor = .green
//        make.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//      
//        make.text = "올바른 형식의 이메일입니다."
//        make.isHidden = true
//    }
//
//    lazy var emailButton = UIButton().then { make in
//        make.setTitle("인증메일 받기", for: .normal)
//        make.titleLabel?.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 700)
//        make.setTitleColor(.black, for: .normal)
//        make.backgroundColor = .darkGray
//        
//        make.layer.cornerRadius = 8
//        make.isUserInteractionEnabled = true
//    }
//
//    // 인증번호 입력 섹션
//    lazy var authCodeLabel = UILabel().then { make in
//        make.text = "이메일 인증번호를 입력해주세요"
//        make.font = .customFont(font: .SFPro, ofSize: 21,rawValue : 700)
//        make.textColor = .white
//        make.isHidden = true
//    }
//
//    lazy var authCodeField = UITextField().then { make in
//        make.placeholder = "인증번호"
//        make.borderStyle = .roundedRect
//        make.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        make.backgroundColor = UIColor(white: 0.2, alpha: 1)
//        make.textColor = .black
//        make.attributedPlaceholder = NSAttributedString(
//            string: "인증번호",
//            attributes: [.foregroundColor: UIColor.lightGray]
//        )
//        make.isHidden = true
//    }
//
//    lazy var authErrorLabel = UILabel().then { make in
//        make.textColor = .red
//        make.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        make.text = "잘못된 인증번호입니다."
//        make.isHidden = true
//    }
//
//    lazy var authSuccessLabel = UILabel().then { make in
//        make.textColor = .green
//        make.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        make.text = "올바른 인증번호입니다."
//        make.isHidden = true
//    }
//    lazy var nextButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.setTitle("다음", for: .normal)
//        button.titleLabel?.font = .customFont(font: .SFPro, ofSize: 16,rawValue : 700)
//        
//      
//        button.backgroundColor = .clear
//        button.setTitleColor(UIColor(white: 1.0, alpha: 0.5), for: .normal)
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor(hex: "#2D2D2C")?.cgColor
//        button.layer.cornerRadius = 8
//        button.clipsToBounds = true
//        button.isEnabled = false // 초기 상태에서 비활성화
//        return button
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .black
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        addSubview(leftArrowButton)
//        
//        addSubview(titleLabel)
//        addSubview(progress1)
//        
//        addSubview(instructionLabel)
//        addSubview(emailField)
//        addSubview(errorLabel)
//        addSubview(successLabel)
//        addSubview(emailButton)
//        addSubview(authCodeLabel)
//        addSubview(authCodeField)
//        addSubview(authErrorLabel)
//        addSubview(authSuccessLabel)
//        addSubview(nextButton)
//    }
//
//    private func setupConstraints() {
//     
//        leftArrowButton.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide).offset(20)
//            make.leading.equalToSuperview().offset(16)
//            make.centerY.equalTo(titleLabel)
//            make.width.height.equalTo(24)
//        }
//        
//     
//      
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide).offset(10)
//            make.leading.equalTo(leftArrowButton.snp.trailing).offset(40)
//        }
//        progress1.snp.makeConstraints { make in
//            make.top.equalTo(leftArrowButton.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//        }
//        instructionLabel.snp.makeConstraints { make in
//            make.top.equalTo(progress1.snp.bottom).offset(60)
//            make.leading.equalToSuperview().offset(46)
//        }
//
//        emailField.snp.makeConstraints { make in
//            make.top.equalTo(instructionLabel.snp.bottom).offset(20)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//            
//        }
//
//        errorLabel.snp.makeConstraints { make in
//            make.top.equalTo(emailField.snp.bottom).offset(4)
//            make.leading.equalTo(emailField)
//        }
//
//        successLabel.snp.makeConstraints { make in
//            make.top.equalTo(emailField.snp.bottom).offset(4)
//            make.leading.equalTo(emailField)
//        }
//
//        emailButton.snp.makeConstraints { make in
//            make.top.equalTo(successLabel.snp.bottom).offset(15)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(emailField.snp.width)
//            
//            make.height.equalTo(45)
//        }
//
//        authCodeLabel.snp.makeConstraints { make in
//            make.top.equalTo(emailButton.snp.bottom).offset(30)
//            make.leading.equalToSuperview().offset(46)
//         
//            
//        }
//
//        authCodeField.snp.makeConstraints { make in
//            make.top.equalTo(authCodeLabel.snp.bottom).offset(16)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//
//        authErrorLabel.snp.makeConstraints { make in
//            make.top.equalTo(authCodeField.snp.bottom).offset(20)
//            make.leading.equalTo(authCodeField)
//        }
//
//        authSuccessLabel.snp.makeConstraints { make in
//            make.top.equalTo(authCodeField.snp.bottom).offset(8)
//            make.leading.equalTo(authCodeField)
//        }
//
//        nextButton.snp.makeConstraints { make in
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//    }
//    func updateNextButtonState(isEnabled: Bool) {
//        nextButton.isEnabled = isEnabled
//        
//        if isEnabled {
//            nextButton.backgroundColor = UIColor(hex: "#2D2D2C")
//            nextButton.setTitleColor(.white, for: .normal)
//        } else {
//            nextButton.backgroundColor = .clear
//            nextButton.setTitleColor(UIColor(white: 1.0, alpha: 0.5), for: .normal)
//            nextButton.layer.borderWidth = 1
//            nextButton.layer.borderColor = UIColor(hex: "#2D2D2C")?.cgColor
//        }
//    }
//    func updateEmailButtonState(isEnabled: Bool) {
//        emailButton.isEnabled = isEnabled
//        if isEnabled {
//            emailButton.backgroundColor = UIColor(hex: "#2D2D2C")
//            emailButton.setTitleColor(.white, for: .normal)
//        } else {
//            emailButton.backgroundColor = .clear
//            emailButton.setTitleColor(.white, for: .normal)
//            emailButton.layer.borderWidth = 1
//            emailButton.layer.borderColor = UIColor(hex: "#2D2D2C")?.cgColor
//        }
//    }
//
//
//}
