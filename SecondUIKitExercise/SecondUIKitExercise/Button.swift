//
//  Button.swift
//  SecondUIKitExercise
//
//  Created by Лада Зудова on 05.03.2023.
//

import UIKit

class Button: UIButton {
    private static let imageOffset: CGFloat = 8

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintColor != .systemBlue {
            backgroundColor = .lightGray
        } else {
            backgroundColor = .green
        }
    }
    
    init(text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        backgroundColor = .green
        layer.cornerRadius = 5
        setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
        semanticContentAttribute = .forceRightToLeft
        
        setImageWithEdgeInsets()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageWithEdgeInsets(){
        imageEdgeInsets.right = -Button.imageOffset
        imageEdgeInsets.left = Button.imageOffset
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14 + Button.imageOffset)
    }
    override var canBecomeFirstResponder: Bool {
        print(super.canBecomeFirstResponder)
        return super.canBecomeFirstResponder
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction]) { [weak self] in
            self?.transform = .identity
        }
    }
}
