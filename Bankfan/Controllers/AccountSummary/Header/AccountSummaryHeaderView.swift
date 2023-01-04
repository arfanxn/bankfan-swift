//
//  AccountSummaryHeaderView.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import Foundation
import UIKit

class AccountSummaryHeaderView : UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var welcomeLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    private let shakeyBellView = ShakeyBellView()
    
    // View model
    private var vm : ViewModel?
    struct ViewModel {
        let welcomeMessage : String
        let date : Date
        
        var dateFormatted : String {
            return date.monthDayYearString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    private func setupContentView() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .Asset.primary
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.setupShakeyBell()
    }
    
    private func setupShakeyBell() {
        addSubview(shakeyBellView)
        shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shakeyBellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shakeyBellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AccountSummaryHeaderView {
    public func configure (with vm : ViewModel) {
        self.vm = vm
        self.welcomeLabel.text = vm.welcomeMessage
        self.dateLabel.text = vm.dateFormatted
    }
}
