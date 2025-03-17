////
////  RegisterVC.swift
////  CAPDESIGN
////
////  Created by 손현빈 on 3/6/25.
////
//
//import UIKit
//
//class RegisterVC: UIViewController, UITextFieldDelegate {
//
//    private let registerView = RegisterView()
//    private let userService = UserService()
//    override func loadView() {
//        self.view = registerView // RegisterView를 메인 뷰로 설정
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupActions()
//        registerView.authCodeField.delegate = self // Delegate 설정
//        self.navigationController?.navigationBar.isHidden = true
//        
//    }
//  
//    private func setupActions() {
//        // "인증메일 받기" 버튼 동작
//        registerView.emailButton.addTarget(self, action: #selector(handleEmailButtonTap), for: .touchUpInside)
//        
//        // "다음" 버튼 동작
//        registerView.nextButton.addTarget(self, action: #selector(handleNextButtonTap), for: .touchUpInside)
//        registerView.emailField.addTarget(self,action: #selector(handleTextFieldEditingChanged), for: .editingChanged)
//        registerView.authCodeField.addTarget(self,action: #selector (handleTextFieldEditingChanged), for: .editingChanged)
//        registerView.leftArrowButton.addTarget(self,action: #selector(leftButtonTapped),for: .touchUpInside)
//  
//    }
//    @objc private func leftButtonTapped(){
//        navigationController?.popViewController(animated: true)
//    }
//
//    @objc private func handleEmailButtonTap() {
//        guard let email = registerView.emailField.text, !email.isEmpty else {
//            showAlert(message : "이메일을 입력해주세요")
//            registerView.errorLabel.isHidden = false
//            registerView.errorLabel.text = "이메일을 입력해주세요"
//            registerView.successLabel.isHidden = true
//            return
//        }
//// API 추가 부분
//        if isValidEmail(email) {
//              // 이메일 형식이 올바르면 서버에 인증 코드 요청
//            userService.sendVerificationCode(email: email ) { [weak self] result in
//                  guard let self = self else { return }
//                   
//                      switch result {
//                      case .success(let response):
//                          self.registerView.errorLabel.isHidden = true
//                          self.registerView.successLabel.isHidden = false
//                          
//                          if let cipherCode = response {
//                              //  Keychain에 cipherCode 저장
//                              let status = KeychainService.shared.save(account: .userInfo, service: .cipherCode, value: cipherCode)
//                              if status == errSecSuccess {
//                                  print(" cipherCode가 Keychain에 저장되었습니다.")
//                              } else {
//                                  print(" Keychain 저장 실패: \(status)")
//                              }
//                          }
//                          self.registerView.successLabel.text = "인증 코드가 전송되었습니다."
//
//                          self.registerView.authCodeLabel.isHidden = false
//                          self.registerView.authCodeField.isHidden = false
//                          
//                          self.registerView.nextButton.isEnabled = true
//                      case .failure(let error):
//                          self.registerView.errorLabel.isHidden = false
//                          print("Error: \(error.localizedDescription)")
//                          showAlert(message : "인증 코드 요청에 실패했습니다")
//                          self.registerView.errorLabel.text = "인증 코드 요청에 실패했습니다: \(error.localizedDescription)"
//                          
//                          self.registerView.successLabel.isHidden = true
//                      }
//                  
//              }
//          } else {
//              registerView.errorLabel.isHidden = false
//              showAlert(message : "올바르지 않은 형식의 이메일입니다")
//              registerView.errorLabel.text = "올바르지 않은 형식의 이메일입니다"
//              registerView.successLabel.isHidden = true
//          }
//      }
//
// 
//
//    @objc private func handleNextButtonTap() {
//        print("handleNextButtonTap")
//        guard let email = registerView.emailField.text, !email.isEmpty else {
//                   showAlert(message: "이메일을 입력해주세요.")
//                   return
//               }
//
//               guard let authCode = registerView.authCodeField.text, !authCode.isEmpty else {
//                   showAlert(message: "이메일 인증번호를 입력해주세요.")
//                   return
//               }
//
//               guard let cipherCode = KeychainService.shared.load(account: .userInfo, service: .cipherCode) else {
//                   showAlert(message: "인증코드 요청을 먼저 진행해주세요.")
//                   return
//               }
//        
//        guard let authCode = registerView.authCodeField.text, !authCode.isEmpty else {
//            registerView.authErrorLabel.isHidden = false
//            
//            registerView.authErrorLabel.text = "인증번호를 입력해주세요."
//            registerView.authSuccessLabel.isHidden = true
//            registerView.nextButton.isEnabled = false
//            registerView.nextButton.backgroundColor = UIColor(white: 0.2, alpha: 1)
//            return
//        }
//        
//        //  Keychain에서 `cipherCode` 가져오기
//        guard let cipherCode = KeychainService.shared.load(account: .userInfo, service: .cipherCode) else {
//            print(" Keychain에서 cipherCode를 찾을 수 없습니다.")
//            registerView.authErrorLabel.isHidden = false
//            registerView.authErrorLabel.text = "인증코드 요청을 먼저 진행해주세요."
//            return
//        }
//
//        //  CheckVerificationCodeRequestDTO 생성
//        let checkDTO = CheckVerificationCodeRequestDTO(cipherCode: cipherCode, code: authCode)
//
//        //  인증 코드 확인 요청
//        userService.checkVerificationCode(parameter: checkDTO) { [weak self] result in
//            guard let self = self else { return }
//            DispatchQueue.main.async {
//                switch result {
//                case .success:
//                    //  인증번호 확인 성공
//                    print(" 인증번호 확인 성공")
//
//                    self.registerView.authErrorLabel.isHidden = true
//                    self.registerView.authSuccessLabel.isHidden = false
//                    self.registerView.authSuccessLabel.text = "올바른 인증번호입니다."
//                    self.registerView.nextButton.isEnabled = true
//                    self.registerView.nextButton.backgroundColor = .systemBlue
//                        // 이메일 값 저장하기
//                    UserSignupData.shared.email = self.registerView.emailField.text ?? ""
//
//                    //  다음 화면(Register2VC)으로 이동
//                    let register2VC = Register2VC()
//                    self.navigationController?.pushViewController(register2VC, animated: true)
//
//                case .failure(let error):
//                    //  인증 실패 처리
//                    print(" 인증번호 확인 실패: \(error.localizedDescription)")
//                    self.registerView.authErrorLabel.isHidden = false
//                    self.registerView.authErrorLabel.text = "잘못된 인증번호입니다. 다시 시도해주세요."
//                    self.registerView.authSuccessLabel.isHidden = true
//                    self.registerView.nextButton.isEnabled = false
//                    self.registerView.nextButton.backgroundColor = UIColor(hex: "#2D2D2C")                }
//            }
//        }
//    }
//
//    @objc private func handleTextFieldEditingChanged(_ sender: UITextField) {
//        if let text = sender.text, !text.isEmpty {
//                sender.backgroundColor = .white
//            } else {
//                sender.backgroundColor = UIColor(white: 0.2, alpha: 1)
//            }
//        
//        let isEmailEntered = !(registerView.emailField.text?.isEmpty ?? true)
//        let isAuthCodeEntered = !(registerView.authCodeField.text?.isEmpty ?? true)
//        
//        let isEmailValid = isValidEmail(registerView.emailField.text ?? "")
//           registerView.updateEmailButtonState(isEnabled: isEmailValid)
//
//        
//        let isEnabled = isEmailEntered && isAuthCodeEntered
//        registerView.updateNextButtonState(isEnabled: isEnabled)
//    }
//
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            if textField == registerView.authCodeField {
//                handleNextButtonTap() // 인증 코드 확인 요청
//            }
//            return true
//        }
//    
//    private func isValidEmail(_ email: String) -> Bool {
//        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
//        return emailPredicate.evaluate(with: email)
//    }
//    private func showAlert(message: String) {
//           let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
//           let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//           alert.addAction(okAction)
//           present(alert, animated: true)
//       }
//}
