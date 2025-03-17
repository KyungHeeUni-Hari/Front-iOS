//
//  AccountBookVC.swift
//  CAPDESIGN
//
//  Created by 손현빈 on 3/17/25.
//

import UIKit

class AccountBookVC: UIViewController {
    
    var selectedDate: Date?
    private let accountBookView = AccountBookView()
    
    override func loadView() {
        self.view = accountBookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       accountBookView.incomeButton.addTarget(self, action: #selector(addExpense), for: .touchUpInside)
        accountBookView.expenseButton.addTarget(self, action: #selector(addExpense), for: .touchUpInside)
      
        updateDateLabel()
    }
    
    private func updateDateLabel() {
        guard let date = selectedDate else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        accountBookView.dateLabel.text = formatter.string(from: date)
    }
    
    @objc private func addExpense() {
        print("새로운 항목 추가")
    }
}

//  TableView DataSource & Delegate
extension AccountBookVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // 예제 데이터 (실제 데이터 연동 가능)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "항목 \(indexPath.row + 1)" // 예제 데이터
        return cell
    }
}
