////
////  LoginVC.swift
////  CAPDESIGN
////
////  Created by 손현빈 on 3/6/25.
////
//
//import UIKit
//
//class LoginVC: UIViewController {
//    private let loginView = LoginView()
//    private let userService = UserService() // UserService 인스턴스 추가
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // 배경색 설정
//        view.backgroundColor = .black
//
//        // LoginView 추가
//        view.addSubview(loginView)
//
//        // Auto Layout 설정
//        loginView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        // 버튼 액션 설정
//        setupActions()
//    
//        // 음악 재생 기록 예시
//
//    }
//
//    private func setupActions() {
//        // 회원가입 버튼 액션
//        
//        loginView.emailButton.addTarget(self, action: #selector(navigateToRegister), for: .touchUpInside)
//
//        // 로그인 버튼 액션
//        loginView.loginButton.addTarget(self, action: #selector(handleLoginButtonTap), for: .touchUpInside)
//    }
//
//    @objc private func navigateToRegister() {
//        let nextVC = RegisterVC() // 회원가입 화면 생성
//        navigationController?.pushViewController(nextVC, animated: true)
//    }
//
//    @objc private func handleLoginButtonTap() {
//        guard let email = loginView.emailField.text, !email.isEmpty,
//              let password = loginView.passwordField.text, !password.isEmpty else {
//            // 입력값이 없을 경우 알림 표시
//            showAlert(title: "Error", message: "이메일과 비밀번호를 입력해주세요.")
//            return
//        }
//
//        // LoginRequestDTO 생성
//        let loginParameter = LoginRequestDTO(email: email, password: password)
//
//        // 로그인 API 호출
//        userService.login(parameter: loginParameter) { [weak self] result in
//            switch result {
//            case .success(let response):
//                //토큰 추가해야함 keychain
//                    if let token = response {
//                        KeychainService.shared.save(account: .token, service: .serverAccessToken, value: token)
//                        print(" 토큰 저장 완료: \(token)")
//                        self?.getUserInfo()
//                    }
//
//                DispatchQueue.main.async {
//                    // 다음 화면으로 전환
//                    self?.navigateToNextScreen()
//                }
//            case .failure(let error):
//                // 네트워크 연결 실패 얼럿
//                let alert = NetworkAlert.shared.getAlertController(title: error.description)
//                self?.present(alert, animated: true)
//            }
//        }
//    }
//
//    private func navigateToNextScreen() {
//        // 로그인 성공 시 이동할 화면 여기를 다른거로 이으면 돼요
//        let nextVC = OnBoarding2VC()
////        self.present(nextVC, animated: true)
//        self.navigationController?.pushViewController(nextVC, animated: true)
//    }
//
//    private func showAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alert, animated: true)
//    }
//    
//    // 음악 기록 API
//    func postPlayingRecord(param: UserPlayingRecordRequestDTO){
//        userService.playingRecord(parameter: param){ [weak self] result in
//            guard let self = self else { return }
//            
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                // 네트워크 연결 실패 얼럿
//                let alert = NetworkAlert.shared.getAlertController(title: error.description)
//                self.present(alert, animated: true)
//            }
//        }
//    }
//    
//    // 사용자 정보 불러오기
//    private func getUserInfo() {
//        userService.userInfo { [weak self] result in
//            guard let self = self else {return}
//            switch result {
//            case .success(let response):
//                guard let response = response else { return }
//                // 키체인 저장
//                KeychainService.shared.save(account: .userInfo, service: .profileImage, value: response.profileImage)
//                KeychainService.shared.save(account: .userInfo, service: .nickname  , value: response.nickname)
//            case .failure(let error):
//                let alert = NetworkAlert.shared.getAlertController(title: error.description)
//                self.present(alert, animated: true)
//            }
//        }
//    }
//}
