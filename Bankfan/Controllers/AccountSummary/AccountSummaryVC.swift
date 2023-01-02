//
//  AccountSummaryVC.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import UIKit

class AccountSummaryVC: UIViewController {
    
    // Data
    private var accounts = [AccountSummaryTableViewCell.ViewModel]()
    
    // View
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Methods
extension AccountSummaryVC {
    
    private func setup() {
        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .Asset.primary
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: AccountSummaryTableViewCell.identifier)
        tableView.rowHeight = AccountSummaryTableViewCell.rowHeight
        tableView.tableFooterView = UIView()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
    
    private func fetchData() {
        let accounts = [
            AccountSummaryTableViewCell.ViewModel(accountType: .Banking,
                                                  accountName: "Basic Savings",
                                                  balance: 929466.23),
            AccountSummaryTableViewCell.ViewModel(accountType: .Banking,
                                                  accountName: "No-Fee All-In Chequing",
                                                  balance: 17562.44),
            AccountSummaryTableViewCell.ViewModel(accountType: .CreditCard,
                                                  accountName: "Visa Avion Card",
                                                  balance: 412.83),
            AccountSummaryTableViewCell.ViewModel(accountType: .CreditCard,
                                                  accountName: "Student Mastercard",
                                                  balance: 50.83),
            AccountSummaryTableViewCell.ViewModel(accountType: .Investment,
                                                  accountName: "Tax-Free Saver",
                                                  balance: 2000.00),
            AccountSummaryTableViewCell.ViewModel(accountType: .Investment,
                                                  accountName: "Growth Fund",
                                                  balance: 15000.00),
        ]
        
        self.accounts = accounts
    }
}

// MARK: - Table View Data Source
extension AccountSummaryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard self.accounts.isEmpty == false else { return .init()  }
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryTableViewCell.identifier, for: indexPath) as! AccountSummaryTableViewCell
        cell.configure(with: self.accounts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accounts.count
    }
}

// MARK: - Table View Delegate
extension AccountSummaryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
