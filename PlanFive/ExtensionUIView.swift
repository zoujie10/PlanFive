//
//  ExtensionUIView.swift
//  PlanFive
//
//  Created by Zoujie on 2017/4/6.
//  Copyright © 2017年 Zoujie. All rights reserved.
//
import UIKit
import Foundation

extension UIView{
	var left : CGFloat {return self.frame.origin.x}
	var right : CGFloat {return self.frame.origin.x + self.frame.size.width}
	var bottom : CGFloat {return self.frame.origin.y + self.frame.size.height}
	var top : CGFloat {return self.frame.origin.y}
	var width : CGFloat {return self.frame.size.width}
	var height : CGFloat {return self.frame.size.height}
}

typealias buttonClick = (()->()) // 定义数据类型(其实就是设置别名)
extension UIButton{
    // 改进写法【推荐】
    private struct RuntimeKey {
        static let actionBlock = UnsafeRawPointer.init(bitPattern: "actionBlock".hashValue)
        /// ...其他Key声明
    }
    /// 运行时关联
    private var actionBlock: buttonClick? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.actionBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.actionBlock!) as? buttonClick
        }
    }
    /// 点击回调
    @objc func tapped(button:UIButton){
        if self.actionBlock != nil {
            self.actionBlock!()
        }
    }
    /// 快速创建
    convenience init(action:@escaping buttonClick){
        self.init()
        self.addTarget(self, action:#selector(tapped(button:)) , for:.touchUpInside)
        self.actionBlock = action
        self.sizeToFit()
    }
    /// 快速创建
    convenience init(setImage:String, action:@escaping buttonClick){
        self.init()
        self.frame = frame
        self.setImage(UIImage(named:setImage), for: UIControlState.normal)
        self.addTarget(self, action:#selector(tapped(button:)) , for:.touchUpInside)
        self.actionBlock = action
        self.sizeToFit()
    }
    /// 快速创建按钮 setImage: 图片名 frame:frame action:点击事件的回调
    convenience init(setImage:String, frame:CGRect, action: @escaping buttonClick){
        self.init( setImage: setImage, action: action)
        self.frame = frame
    }
    
}
