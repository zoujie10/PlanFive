//
//  HomeBottomView.swift
//  PlanFive
//
//  Created by 邹杰 on 6/11/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class HomeBottomView: UIView {
    
    lazy var mouthButton : UIButton = {
        let mouthButton = UIButton()
        mouthButton.addTarget(self, action:#selector(chooseMounth), for: UIControlEvents.touchUpInside)
        mouthButton.setTitle("月份", for: UIControlState.normal)
        mouthButton.setBackgroundImage(UIImage.init(named: "buttonBackground"), for: UIControlState.normal)
        return mouthButton
    }()
    
    lazy var alertLabel : UILabel = {
        let alertLable = UILabel()
        alertLable.lineBreakMode = NSLineBreakMode.byWordWrapping
        alertLable.textAlignment = NSTextAlignment.center
        alertLable.text = "每日计划"
        alertLable.font = UIFont.systemFont(ofSize: 18)
//        alertLable.layer.addSublayer(myLayer)
        return alertLable
    }()
    
//    private lazy var myLayer:CAShapeLayer = {
//        let path = UIBezierPath.init(roundedRect: self.alertLabel.bounds, byRoundingCorners: [.topRight , .bottomRight] , cornerRadii: self.alertLabel.bounds.size);
//        let layer = CAShapeLayer.init();
//        layer.path = path.cgPath;
//        layer.lineWidth = 2;
//        layer.lineCap = kCALineCapSquare;
//        layer.strokeColor = UIColor.red.cgColor;
//        //  注意直接填充layer的颜色，不需要设置控件view的backgroundColor
//        layer.fillColor = UIColor.black.cgColor;
//        return layer;
//        }()
 
    public override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    func makeUI(){
        self.backgroundColor = UIColor.gray
        self.addSubview(alertLabel)
        self.addSubview(mouthButton)
        
        alertLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: UILayoutConstraintAxis.vertical)
        alertLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(45)
        }
        
        mouthButton.snp.makeConstraints { (make) in
            make.top.equalTo(alertLabel.bottom).offset(10)
            make.left.equalTo(alertLabel)
            make.height.equalTo(45)
            make.width.equalTo(65)
        }
    }
    
    
    @objc func chooseMounth(){
        print("Pick View")
    }
}
