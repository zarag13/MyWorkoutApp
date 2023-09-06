//
//  BaseView.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureAppearance()
        setupLayoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    func setupViews() {}
    
    func setupLayoutViews() {}
    
    func configureAppearance() {
        backgroundColor = .white
    }
}
