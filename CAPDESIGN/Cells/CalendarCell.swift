//
//  CalendarCell.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/14/25.
//

import UIKit
class CalendarCell : UICollectionViewCell,UICalendarSelectionSingleDateDelegate {
    static let identifier = "CalendarCell"
    
 
    lazy var CalendarImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar") 
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
   
    lazy var dateView : UICalendarView = {
        var view = UICalendarView()
        view.translatesAutoresizingMaskIntoConstraints = false
               view.wantsDateDecorations = true
        return view
    }()
    // 지출
    private var expenseLabel : UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "0"
        label.textAlignment = .center
                return label
        
    }()
    // 소비
    private var incomeLabel: UILabel = {
           let label = UILabel()
           label.textColor = .green
           label.text = "0" // 기본 값
           label.textAlignment = .center
           return label
       }()
    
    private lazy var selection: UICalendarSelectionSingleDate = {
        let selection = UICalendarSelectionSingleDate(delegate: self)
        return selection
    }()
    // 날짜에 대해서 소비와 지출 저장시켜주는 데이터
    var dateData: [Date: (expense: Double, income: Double)] = [:]
        
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
        
           dateView.selectionBehavior = selection // 날짜 선택
    }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   

    private func setupViews(){
        contentView.addSubview(CalendarImage)
        contentView.addSubview(dateView)
        contentView.addSubview(expenseLabel)
                contentView.addSubview(incomeLabel)
        
    }

    private func setupConstraints(){
        CalendarImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(contentView).offset(20)
        }
        dateView.snp.makeConstraints { make in
            make.top.equalTo(CalendarImage.snp.bottom).offset(10)
                  make.leading.equalTo(contentView).offset(20)
                  make.trailing.equalTo(contentView).offset(-20)
                  make.height.equalTo(500) // 높이는 디자인에 맞게 조정
              }

              expenseLabel.snp.makeConstraints { make in
                  make.top.equalTo(dateView.snp.bottom).offset(10)
                  make.leading.equalTo(contentView).offset(20)
                  make.trailing.equalTo(contentView).offset(-20)
              }

              incomeLabel.snp.makeConstraints { make in
                  make.top.equalTo(expenseLabel.snp.bottom).offset(5)
                  make.leading.equalTo(contentView).offset(20)
                  make.trailing.equalTo(contentView).offset(-20)
              }
    }
    // 날짜 선택 함수
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents = dateComponents,
              let selectedDate = Calendar.current.date(from: dateComponents) else { return }
        
        // 선택된 날짜에 맞는 지출과 수입 데이터를 업데이트
                updateExpenseAndIncome(for: selectedDate)
                showAccountBookView(for: selectedDate)
    }
    private func updateExpenseAndIncome(for date: Date) {
           // 예시 데이터
           let expense = dateData[date]?.expense ?? 0
           let income = dateData[date]?.income ?? 0
           
           // 레이블에 표시
           expenseLabel.text = "지출: \(expense)"
           incomeLabel.text = "수입: \(income)"
       }
    // 팝업 창
      private func showAccountBookView(for date: Date) {
          guard let parentViewController = self.findViewController() else { return }
          
          let accountBookVC = AccountBookVC()
          accountBookVC.selectedDate = date
          
          accountBookVC.modalPresentationStyle = .overFullScreen
          parentViewController.present(accountBookVC, animated: true)
      }
  
    
   
}

extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
