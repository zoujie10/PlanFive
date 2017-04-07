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
