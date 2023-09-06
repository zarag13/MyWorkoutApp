//
//  UIView + extension.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

extension UIView {
    func  addBottomBorder(color: UIColor, height: CGFloat ) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
    
    func makeSystem(_  button: UIButton) {
        button.addTarget(self, action: #selector(handeIn), for: [.touchDown, .touchDragInside])
        button.addTarget(self, action: #selector(handeOut), for: [.touchDragOutside, .touchUpInside, .touchUpOutside, .touchDragExit, .touchCancel])
    }
    
    @objc func handeIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
            
        }
    }
    @objc func handeOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
            
        }
    }
    
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
