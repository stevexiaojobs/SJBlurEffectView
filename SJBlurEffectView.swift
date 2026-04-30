//
//  SJBlurEffectView.swift
//
//  MIT License - Copyright (c) 2026 stevexiaojobs
//

import UIKit

class SJBlurEffectView: UIVisualEffectView {
    /// 模糊半径：0～1
    var radius: Double = 1 {
        didSet {
            animator?.fractionComplete = radius
        }
    }

    /// 构造器
    convenience init(radius: Double = 1) {
        self.init(frame: .zero)
        self.radius = radius
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        subviews.forEach { $0.backgroundColor = nil }
    }

    override func didMoveToWindow() {
        if window != nil {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(initAnimator),
                                                   name: UIApplication.didBecomeActiveNotification,
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(deinitAnimator),
                                                   name: UIApplication.willResignActiveNotification,
                                                   object: nil)
            
            DispatchQueue.main.async {
                self.initAnimator()
            }
            
        } else {
            NotificationCenter.default.removeObserver(self)
            
            deinitAnimator()
        }
    }

    // MARK: Animator

    private var animator: UIViewPropertyAnimator?

    /// 初始化动画
    @objc private func initAnimator() {
        guard animator == nil else { return }
        
        effect = nil
        animator = UIViewPropertyAnimator(duration: 0, curve: .linear) { [weak self] in
            self?.effect = UIBlurEffect(style: .regular)
        }
        animator?.fractionComplete = radius
    }

    /// 销毁动画
    @objc private func deinitAnimator() {
        animator?.stopAnimation(true)
        animator = nil
    }
}
