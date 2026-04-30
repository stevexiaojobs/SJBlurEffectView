# SJBlurEffectView
一个可自定义模糊半径的 `UIVisualEffectView` 子类。系统的 `UIBlurEffect` 只提供固定档位的模糊强度，`SJBlurEffectView` 通过 `UIViewPropertyAnimator` 实现 0～1 之间任意模糊程度的连续控制。

## 特性

- 模糊程度 0～1 连续可调
- 支持运行时动态修改
- 自动处理 App 前后台切换时 animator 的生命周期
- 无私有 API，无 Core Image 开销
- 单文件，无依赖

## 使用

```swift
// 创建一个 50% 模糊程度的视图
let blurView = SJBlurEffectView(radius: 0.5)
view.addSubview(blurView)

// 动态调整模糊程度
blurView.blur = 0.8

// 自定义背景色
blurView.backgroundColor = .black.withAlphaComponent(0.05)

// 添加不带模糊效果的子视图
let titleLabel = UILabel()
blurView.contentView.addSubview(titleLabel)
```

## 安装

复制 `BlurView.swift` 到你的项目中。
