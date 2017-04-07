//
//  ViewController.swift
//  PlanFive
//
//  Created by Zoujie on 2017/4/5.
//  Copyright © 2017年 Zoujie. All rights reserved.
//

import UIKit

let TitleView = UIView()
let backScrollView = UIScrollView()
class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.view.backgroundColor = UIColor.white
		//TODO:UI布局
		self.view.addSubview(backScrollView)
		makeCollectionView()
		makeTitileUI()
		
		self.view.addSubview(TitleView)
		self.view.addSubview(backScrollView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func makeTitileUI() -> Void{
		//标题视图
		TitleView.backgroundColor = UIColor.white
		TitleView.frame = CGRect(x:0,y:0,width:self.view.width,height:45+20+35)
		
		//左边Btn
		let leftBtn = UIButton(type: .custom)
		leftBtn.frame = CGRect(x:10,y:20,width:45,height:45)
		leftBtn.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
		leftBtn.setTitle("月份", for: .normal)
		leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		leftBtn.setTitleColor(.black, for: .normal)
		leftBtn.setTitleColor(.gray, for: .highlighted)
		leftBtn.backgroundColor = UIColor.brown
		leftBtn.isSelected = false
		
		//title
		let TitleLabel = UILabel()
		TitleLabel.backgroundColor = UIColor.white
		TitleLabel.text = "习惯养成计划"
		TitleLabel.frame = CGRect(x:leftBtn.frame.origin.x + leftBtn.frame.width,y:20,width:self.view.frame.width - leftBtn.frame.width * 2 - 20,height:45)
		TitleLabel.textAlignment = NSTextAlignment.center
		
		//右边button
		let rightBtn = UIButton()
		rightBtn.frame = CGRect(x:TitleLabel.frame.origin.x + TitleLabel.frame.width,y:20,width:leftBtn.frame.width,height:45)
		rightBtn.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
		rightBtn.setTitle("月份", for: .normal)
		rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		rightBtn.setTitleColor(.black, for: .normal)
		rightBtn.setTitleColor(.gray, for: .highlighted)
		rightBtn.backgroundColor = UIColor.white
		rightBtn.isSelected = false
		
		let TitileBottomline = UIView()
		TitileBottomline.backgroundColor = UIColor.gray
		TitileBottomline.frame = CGRect(x:0,y:rightBtn.frame.origin.y + rightBtn.frame.height,width:self.view.frame.width,height:1)
		
		//月份Lable
		let monthLabel = UILabel()
		monthLabel.frame = CGRect(x:0,y:rightBtn.frame.origin.y + rightBtn.frame.height + 1,width:45,height:34)
		monthLabel.backgroundColor = UIColor.orange
		monthLabel.text = "三月"
		monthLabel.textAlignment = NSTextAlignment.center
		
		//Five target TextField
		var loopCount : Int = 0
		for loopCount in 0..<5{
			let textField  = UITextField()
			textField.frame = CGRect(x:monthLabel.width + (self.view.width - monthLabel.width)/5 * CGFloat(loopCount),y:monthLabel.top,width:(self.view.width - monthLabel.width)/5,height:34)
			textField.tag = loopCount
			textField.backgroundColor = UIColor.blue
			TitleView.addSubview(textField)
		}
		
//		TitleView.addSubview(leftBtn)
		TitleView.addSubview(TitleLabel)
		TitleView.addSubview(rightBtn)
		TitleView.addSubview(TitileBottomline)
		TitleView.addSubview(monthLabel)
	}
	
	func makeCollectionView() -> Void{
	//FIXME:未实现collection
	
	
	}

	func makeMemoUI() -> Void {
		//FIXME:未实现备注视图
	}
	//MARK:右上角点击事件
	func clickAction() -> Void {
		print("日期选择")
		//FIXME: 未实现点击选择日期
	}


}

