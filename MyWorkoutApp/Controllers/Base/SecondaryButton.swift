//
//  SecondaryButton.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

enum WAButtonType {
    case primary
    case secondary
}

final class SecondaryButton : UIButton {
    
    private let type: WAButtonType
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    
    init(with type: WAButtonType) {
        self.type = type
        super.init(frame: .zero)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

extension SecondaryButton {
    func addViews() {
        addView(label)
        addView(iconView)
    }
    
    func layoutViews() {
        
        var horizontalOffset: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2)
        ])
        
    }
    func configure() {
        
        switch type {
            
        case .primary:
            label.textColor = Resources.Colors.inaActiy
            iconView.tintColor = Resources.Colors.inaActiy
            label.font = Resources.Founts.helvelticaRegular(with: 13)
        case .secondary:
            label.textColor = Resources.Colors.actiy
            backgroundColor = Resources.Colors.secondary
            layer.cornerRadius = 14
            iconView.tintColor = Resources.Colors.actiy
            label.font = Resources.Founts.helvelticaRegular(with: 15)
        }
        
        makeSystem(self)
        label.textAlignment = .center
        
        //позволяет перекрасить картинку
        iconView.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        
    }
}
