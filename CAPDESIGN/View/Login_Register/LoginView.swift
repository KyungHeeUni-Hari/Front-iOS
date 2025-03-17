////
////  LoginView.swift
////  CAPDESIGN
////
////  Created by 손현빈 on 3/6/25.
////
//
//import Foundation
//import UIKit
//import Then
//import SnapKit
//
//class LoginView: UIView, UITextFieldDelegate {
//
//    // 앱 로고 이미지
//    lazy var appImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "AppLOGO") // 앱 로고 이미지 설정
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    // 이메일 입력 필드
//    lazy var emailField = UITextField().then { make in
//        make.placeholder = "이메일"
//        make.font = UIFont.systemFont(ofSize: 16)
//        make.textColor = .white
//        make.backgroundColor = UIColor(white: 0.2, alpha: 1)
//        make.borderStyle = .roundedRect
//        make.layer.cornerRadius = 8
//        make.clipsToBounds = true
//        make.attributedPlaceholder = NSAttributedString(
//            string: "이메일",
//            attributes: [.foregroundColor: UIColor.lightGray]
//        )
//    }
//
//    // 비밀번호 입력 필드
//    lazy var passwordField = UITextField().then { make in
//        make.placeholder = "비밀번호"
//        make.font = UIFont.systemFont(ofSize: 16)
//        make.textColor = .white
//        make.backgroundColor = UIColor(white: 0.2, alpha: 1)
//        make.borderStyle = .roundedRect
//        make.layer.cornerRadius = 8
//        make.clipsToBounds = true
//        make.isSecureTextEntry = true
//        make.attributedPlaceholder = NSAttributedString(
//            string: "비밀번호",
//            attributes: [.foregroundColor: UIColor.lightGray]
//        )
//    }
//
//    // 로그인 버튼
//    lazy var loginButton = UIButton().then { make in
//        make.setTitle("로그인", for: .normal)
//        make.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        make.setTitleColor(.white, for: .normal)
//        make.backgroundColor = UIColor(white: 0.1, alpha: 1)
//        make.clipsToBounds = true
//        make.layer.cornerRadius = 8
//    }
//// 이메일 버튼
//    var onRegisterButtonTapped: (() -> Void)? // 버튼 액션 클로저
//
//       lazy var emailButton = UIButton().then { make in
//           make.setTitle("이메일로 가입하기", for: .normal)
//           make.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//           make.setTitleColor(.white, for: .normal)
//
//           // 버튼 클릭 액션
//           make.addTarget(self, action: #selector(handleRegisterButtonTapped), for: .touchUpInside)
//       }
//
//       @objc private func handleRegisterButtonTapped() {
//           onRegisterButtonTapped?() // 클로저 호출
//       }
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
//        addSubview(appImage)
//        addSubview(emailField)
//        addSubview(passwordField)
//        addSubview(loginButton)
//        addSubview(emailButton)
//    }
//
//    private func setupConstraints() {
//        // 앱 로고 이미지
//        appImage.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(146.78)
//            make.height.equalTo(197.06)
//        }
//
//        // 이메일 입력 필드
//        emailField.snp.makeConstraints { make in
//            make.top.equalTo(appImage.snp.bottom).offset(40)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//
//        // 비밀번호 입력 필드
//        passwordField.snp.makeConstraints { make in
//            make.top.equalTo(emailField.snp.bottom).offset(16)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//
//        // 로그인 버튼
//        loginButton.snp.makeConstraints { make in
//            make.top.equalTo(passwordField.snp.bottom).offset(24)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(295)
//            make.height.equalTo(45)
//        }
//
//        // 이메일 가입 버튼 (하단 고정)
//        emailButton.snp.makeConstraints { make in
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
//            make.centerX.equalToSuperview()
//        }
//    }
//
//    // UITextFieldDelegate 메서드
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.backgroundColor = UIColor(white: 0.3, alpha: 1)
//        textField.textColor = .white
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.backgroundColor = UIColor(white: 0.2, alpha: 1)
//        textField.textColor = .white
//    }
//}
