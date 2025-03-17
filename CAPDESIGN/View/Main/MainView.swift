//
//  HomeView.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/14/25.
//

import UIKit
import SnapKit

class MainView : UIView, UICollectionViewDelegate,UICollectionViewDataSource  {
    let tabBar : UISegmentedControl = {
        let items : [String] = ["홈", "캘린더", "예측", "설정"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor.systemBackground
       
        segmentedControl.setTitleTextAttributes([
                 .foregroundColor: UIColor.black,
                 .font: UIFont.customFont(font: .SFPro, ofSize: 14, rawValue: 400),
                 .baselineOffset: 7], for: .selected)
             
             segmentedControl.setTitleTextAttributes([
                 .foregroundColor: UIColor.black,
                 .font: UIFont.customFont(font: .SFPro, ofSize: 14, rawValue: 400),
                 .baselineOffset: 7], for: .normal)

             segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
             segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
          
        return segmentedControl
    }()
    
   
    // 탭별 데이터
       private let homeData = ["홈 항목 1", "홈 항목 2", "홈 항목 3"]
       private let calendarData = ["캘린더 항목 1", "캘린더 항목 2"]
       private let predictionData = ["예측 항목 1", "예측 항목 2", "예측 항목 3"]
       private let settingData = ["설정 항목 1", "설정 항목 2"]

    
    let HomeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    let CalendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    let PredictionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    let SettingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
 
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          backgroundColor = .black_100
          setupViews()
          setupConstraints()
            setupActions()
        setupCollectionView()
      }

      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    private func setupActions() {
        tabBar.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
    }
    
    private func setupViews(){
       
        addSubview(SettingCollectionView)
        addSubview(HomeCollectionView)
        addSubview(CalendarCollectionView)
        addSubview(PredictionCollectionView)
        
       
        
        CalendarCollectionView.isHidden = true
          PredictionCollectionView.isHidden = true
          SettingCollectionView.isHidden = true
        addSubview(tabBar)
    }
    private func setupConstraints () {
        HomeCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(tabBar.snp.top).offset(-20)
        }
        SettingCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(HomeCollectionView)
        }
        PredictionCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(HomeCollectionView)
        }
        CalendarCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(HomeCollectionView)
        }
        
        tabBar.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
               make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
               make.height.equalTo(50) // 명확한 높이 설정 추가
       
        }
    }
    
    private func setupCollectionView() {
      // 셀 등록
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100) // 전체 화면 크기로 설정

        HomeCollectionView.collectionViewLayout = layout
        CalendarCollectionView.collectionViewLayout = layout
        PredictionCollectionView.collectionViewLayout = layout
        SettingCollectionView.collectionViewLayout = layout

        HomeCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        CalendarCollectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        PredictionCollectionView.register(PredictionCell.self, forCellWithReuseIdentifier: "PredictionCell")
        SettingCollectionView.register(SettingCell.self, forCellWithReuseIdentifier: "SettingCell")

        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        CalendarCollectionView.dataSource = self
        CalendarCollectionView.delegate = self
        PredictionCollectionView.dataSource = self
        PredictionCollectionView.delegate = self
        SettingCollectionView.dataSource = self
        SettingCollectionView.delegate = self
    }
    
    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
        HomeCollectionView.isHidden = sender.selectedSegmentIndex != 0
        CalendarCollectionView.isHidden = sender.selectedSegmentIndex != 1
        PredictionCollectionView.isHidden = sender.selectedSegmentIndex != 2
        SettingCollectionView.isHidden = sender.selectedSegmentIndex != 3
    }

   

       private func reloadCurrentCollectionView() {
           switch tabBar.selectedSegmentIndex {
           case 0:
               HomeCollectionView.reloadData()
           case 1:
               CalendarCollectionView.reloadData()
           case 2:
               PredictionCollectionView.reloadData()
           case 3:
               SettingCollectionView.reloadData()
           default:
               break
           }
       }

       // MARK: UICollectionViewDataSource
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 1
       }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        switch collectionView {
        case HomeCollectionView:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell

        case CalendarCollectionView:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell

        case PredictionCollectionView:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PredictionCell", for: indexPath) as! PredictionCell

        case SettingCollectionView:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingCell", for: indexPath) as! SettingCell

       
        default:
            // 이 경우는 발생하지 않아야 하지만 안전장치로 추가
            fatalError("Unknown collection view")
        }
        
        return cell
    }

     
    
}
