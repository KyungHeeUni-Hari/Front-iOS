////
////  Register2View.swift
////  CAPDESIGN
////
////  Created by 손현빈 on 3/6/25.
////
//
//import UIKit
//import Then
//import SnapKit
//
//class Register2View: UIView, UITextFieldDelegate {
//    // 백그라운드뷰
//    public let backgroundView = UIView()
//    
//    // 회원가입 타이틀
//    lazy var title = UILabel().then { make in
//        make.textColor = .white
//        make.text = "회원가입"
//        make.font = .customFont(font: .SFPro, ofSize: 18,rawValue : 700)
//        make.textAlignment = .center
//    }
//    lazy var progress2: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "progress2")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    // 왼쪽 화살표 버튼
//    lazy var leftArrowButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "left"), for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//    lazy var successLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .green
//        label.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        label.text = "올바른 형식의 비밀번호입니다."
//        label.isHidden = true
//        return label
//    }()
//
//    lazy var successLabel2: UILabel = {
//        let label = UILabel()
//        label.textColor = .green
//        label.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        label.text = "비밀번호 확인이 완료되었습니다."
//        label.isHidden = true
//        return label
//    }()
//
//    lazy var nextButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("다음", for: .normal)
//        button.titleLabel?.font = .customFont(font: .SFPro, ofSize: 16,rawValue : 700)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(white: 0.2, alpha: 1) // 초기 비활성화 색상
//        button.backgroundColor = .clear
//        button.layer.cornerRadius = 8
//        button.clipsToBounds = true
//        button.isEnabled = false // 초기 상태에서 비활성화
//        return button
//    }()
//    // 오른쪽 화살표 버튼
//    lazy var rightArrowButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//    
//    lazy var pageIndicator: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 8
//
//        for i in 0..<5 {
//            let dot = UIView()
//            dot.backgroundColor = i == 1 ? .white : .darkGray // 두 번째 점만 흰색
//            dot.layer.cornerRadius = 4 // 모서리 둥글게 설정
//            dot.snp.makeConstraints { make in
//                if i == 1 {
//                    make.width.equalTo(16) // 두 번째 점은 긴 점
//                } else {
//                    make.width.equalTo(8) // 나머지는 짧은 점
//                }
//                make.height.equalTo(8) // 높이는 동일
//            }
//            stackView.addArrangedSubview(dot)
//        }
//        return stackView
//    }()
//    
//    // 비밀번호 입력 레이블
//    lazy var register = UILabel().then { make in
//        make.textColor = .white
//        make.text = "비밀번호를 입력해주세요"
//        make.font = .customFont(font: .SFPro, ofSize: 21,rawValue : 700)
//     
//    }
//    
//    lazy var PWField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "비밀번호"
//        textField.isSecureTextEntry = true
//        textField.borderStyle = .roundedRect
//        textField.font = .customFont(font: .SFPro, ofSize: 16,rawValue : 400)
//        textField.delegate = self
//        textField.backgroundColor = UIColor(white: 0.2, alpha: 1) // 기본 배경색
//        textField.textColor = .black_100
//        return textField
//    }()
//    
//    // 비밀번호 오류 메시지
//    lazy var errorLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .red
//        label.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        label.text = "비밀번호는 8~13자리로 설정해주세요"
//        label.isHidden = true
//        return label
//    }()
//    
//    // 비밀번호 확인 레이블
//    lazy var register2 = UILabel().then { make in
//        make.textColor = .white
//        make.text = "비밀번호를 다시 입력해주세요"
//        make.font = .customFont(font: .SFPro, ofSize: 21,rawValue : 700)
//      
//    }
//    
//   
//    lazy var PWField2: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "비밀번호 확인"
//        textField.isSecureTextEntry = true
//        textField.borderStyle = .roundedRect
//        textField.font = .customFont(font: .SFPro, ofSize: 16,rawValue : 400)
//        textField.delegate = self
//        textField.backgroundColor = UIColor(white: 0.2, alpha: 1) // 기본 배경색
//        textField.textColor = .black_100
//        return textField
//    }()
//    // 비밀번호 확인 오류 메시지
//    lazy var errorLabel2: UILabel = {
//        let label = UILabel()
//        label.textColor = .red
//        label.font = .customFont(font: .SFPro, ofSize: 14,rawValue : 400)
//        label.text = "비밀번호가 동일하지 않습니다"
//        label.isHidden = true
//        return label
//    }()
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        // 텍스트 필드에 포커스가 올 때
//        if let text = textField.text, !text.isEmpty {
//            textField.backgroundColor = .white // 입력값이 있을 경우 배경 흰색
//        }
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        // 텍스트 필드 포커스가 사라질 때
//        if let text = textField.text, text.isEmpty {
//            textField.backgroundColor = UIColor(white: 0.2, alpha: 1) // 입력값이 없을 경우 기본 배경색
//        }
//    }
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
//        addSubview(backgroundView)
//        addSubview(leftArrowButton)
//        
//        addSubview(title)
//        addSubview(register)
//        addSubview(successLabel)
//        addSubview(successLabel2)
//        addSubview(PWField)
//        addSubview(errorLabel)
//        addSubview(progress2)
//        addSubview(register2)
//        addSubview(PWField2)
//        addSubview(errorLabel2)
//        addSubview(nextButton)
//    }
//    
//    private func setupConstraints() {
//        backgroundView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        leftArrowButton.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide).offset(20)
//            make.leading.equalToSuperview().offset(16)
//            make.centerY.equalTo(title)
//            make.width.height.equalTo(24)
//        }
//      
//        title.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide).offset(20)
//            make.leading.equalTo(leftArrowButton.snp.trailing).offset(8)
//           
//        }
//        progress2.snp.makeConstraints { make in
//            make.top.equalTo(leftArrowButton.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//        }
//        
//      
//        
//        register.snp.makeConstraints { make in
//           
//            make.top.equalTo(title.snp.bottom).offset(60)
//            make.leading.equalToSuperview().offset(46)
//        }
//        
//        PWField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(register.snp.bottom).offset(20)
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//        successLabel.snp.makeConstraints { make in
//             make.leading.equalTo(PWField)
//             make.top.equalTo(errorLabel.snp.bottom).offset(4) // 성공 메시지 아래 배치
//         }
//        errorLabel.snp.makeConstraints { make in
//            make.leading.equalTo(PWField)
//            make.top.equalTo(PWField.snp.bottom).offset(4)
//        }
//        
//        register2.snp.makeConstraints { make in
//           
//            make.top.equalTo(errorLabel.snp.bottom).offset(30)
//            make.leading.equalToSuperview().offset(46)
//        }
//        
//        PWField2.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(register2.snp.bottom).offset(20)
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//        
//        errorLabel2.snp.makeConstraints { make in
//            make.leading.equalTo(PWField2)
//            make.top.equalTo(PWField2.snp.bottom).offset(4)
//            make.height.equalTo(14)
//        }
//        successLabel2.snp.makeConstraints { make in
//              make.leading.equalTo(PWField2)
//            make.height.equalTo(14)
//            make.top.equalTo(PWField2.snp.bottom).offset(4) // 성공 메시지 아래 배치
//          }
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
//}
