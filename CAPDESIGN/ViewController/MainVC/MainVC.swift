//
//  HomeVC.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/14/25.
//
import UIKit

class MainVC : UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
      
              // 배경색 설정
              view.backgroundColor = .black
      
              // LoginView 추가
              view.addSubview(mainView)
      
              // Auto Layout 설정
              mainView.snp.makeConstraints { make in
                  make.edges.equalToSuperview()
              }
      
              // 버튼 액션 설정
              setupActions()
      
    }
    private func setupActions(){
        mainView.tabBar.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
      
        
    }
    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
         // Home, Calendar, Prediction, Setting 컬렉션 뷰의 보임/숨김 처리
         mainView.HomeCollectionView.isHidden = sender.selectedSegmentIndex != 0
         mainView.CalendarCollectionView.isHidden = sender.selectedSegmentIndex != 1
         mainView.PredictionCollectionView.isHidden = sender.selectedSegmentIndex != 2
         mainView.SettingCollectionView.isHidden = sender.selectedSegmentIndex != 3
     }
}
