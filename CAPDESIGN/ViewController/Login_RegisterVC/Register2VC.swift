////
////  Register2VC.swift
////  CAPDESIGN
////
////  Created by 손현빈 on 3/6/25.
////
//
//import UIKit
//
//class Register2VC: UIViewController {
//    
//    private let register2View = Register2View()
//
//    override func loadView() {
//        self.view = register2View // Register2View를 메인 뷰로 설정
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
//        setupActions()
//       
//        hideKeyboard()
//        
//    }
//
//    private func setupActions() {
//        // 비밀번호 입력 필드에 변경 이벤트 추가
//        register2View.PWField.addTarget(self, action: #selector(handlePasswordInput), for: .editingChanged)
//          register2View.PWField.addTarget(self, action: #selector(handleTextFieldEditingChanged), for: .editingChanged)
//          register2View.PWField2.addTarget(self, action: #selector(handlePasswordConfirmInput), for: .editingChanged)
//          register2View.PWField2.addTarget(self, action: #selector(handleTextFieldEditingChanged), for: .editingChanged)
//          register2View.nextButton.addTarget(self, action: #selector(handleNextButtonTap), for: .touchUpInside)
//        register2View.leftArrowButton.addTarget(self,action: #selector(leftButtonTapped),for: .touchUpInside)
//    }
//    @objc private func leftButtonTapped(){
//        print("눌림!")
//        let moveVC = RegisterVC()
//        navigationController?.pushViewController(moveVC,animated: true)
//    }
//    @objc private func handlePasswordInput() {
//        guard let password = register2View.PWField.text else { return }
//        
//        if password.count >= 8 && password.count <= 13 {
//            // 올바른 비밀번호 형식
//           
//            register2View.successLabel.text = "올바른 형식의 비밀번호입니다."
//            register2View.successLabel.isHidden = false
//            register2View.errorLabel.isHidden = true
//        } else {
//            // 비밀번호 형식 오류
//            register2View.errorLabel.text = "비밀번호는 8~13자리로 설정해주세요."
//            register2View.errorLabel.isHidden = false
//            register2View.successLabel.isHidden = true
//        }
//    }
//
//    @objc private func handlePasswordConfirmInput() {
//        guard let password = register2View.PWField.text,
//              let confirmPassword = register2View.PWField2.text else { return }
//        
//        if confirmPassword.isEmpty {
//            // 입력 확인 필드가 비어있을 경우
//            register2View.errorLabel2.isHidden = true
//            register2View.successLabel2.isHidden = true
//            register2View.nextButton.backgroundColor = .darkGray
//            register2View.nextButton.isEnabled = false
//            return
//        }
//        
//        if password == confirmPassword {
//            // 비밀번호가 일치할 경우
//            register2View.errorLabel2.isHidden = true
//            register2View.successLabel2.text = "비밀번호 확인이 완료되었습니다."
//            register2View.successLabel2.isHidden = false
//            register2View.nextButton.backgroundColor = .darkGray
//            register2View.nextButton.isEnabled = true
//        } else {
//            // 비밀번호가 일치하지 않을 경우
//            register2View.errorLabel2.text = "비밀번호가 동일하지 않습니다."
//            register2View.errorLabel2.isHidden = false
//            register2View.successLabel2.isHidden = true
//            register2View.nextButton.backgroundColor = UIColor(white: 0.2, alpha: 1)
//            register2View.nextButton.isEnabled = false
//        }
//    }
//    @objc private func handleTextFieldEditingChanged(_ sender: UITextField) {
//        if let text = sender.text, !text.isEmpty {
//            sender.backgroundColor = .white // 입력값이 있을 때 배경색 변경
//        } else {
//            sender.backgroundColor = UIColor(white: 0.2, alpha: 1) // 입력값이 없을 때 기본 배경색
//        }
//     
//    }
//    
// 
//    @objc private func handleNextButtonTap() {
//        print("다음 버튼 클릭됨")
//        guard let password = register2View.PWField.text, !password.isEmpty else {
//               showAlert(message: "비밀번호를 입력해주세요.")
//               return
//           }
//           
//           guard let confirmPassword = register2View.PWField2.text, !confirmPassword.isEmpty else {
//               showAlert(message: "비밀번호 확인을 입력해주세요.")
//               return
//           }
//
//           guard password == confirmPassword else {
//               showAlert(message: "비밀번호가 일치하지 않습니다.")
//               return
//           }
//        // 다음 화면으로 전환 로직 추가
//        UserSignupData.shared.password = register2View.PWField.text ?? ""
//
//        let profileselectVC = ProfileSelectVC()
//        navigationController?.pushViewController(profileselectVC, animated: true)
//  
//    }
//    private func showAlert(message: String) {
//        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            view.endEditing(true)
//        }
//    func hideKeyboard() {
//            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
//                                                                     action: #selector(dismissKeyboard))
//        register2View.backgroundView.addGestureRecognizer(tap)
//            
//            // 또는 아래처럼 작성하셔도 됩니다.
//            
//           // view.addGestureRecognizer(UITapGestureRecognizer(target: self,
//           //                                                  action: #selector(dismissKeyboard)))
//        }
//        
//       @objc func dismissKeyboard() {
//           view.endEditing(true)
//       }
//}
