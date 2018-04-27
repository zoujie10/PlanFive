//
//  ViewController.swift
//  PlanFive
//
//  Created by Zoujie on 2017/4/5.
//  Copyright © 2017年 Zoujie. All rights reserved.
//

import UIKit
import SpreadsheetView

class ViewController: UIViewController,SpreadsheetViewDelegate,SpreadsheetViewDataSource {
	var spreadsheetView: SpreadsheetView!
	let TitleView = UIView()
	var leftDate = NSMutableArray()
	var fiveTask = NSArray()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		//MARK:数据源填充
		leftDate = [
			"空位",
			"4.1",
			"4.2",
			"4.3",
			"4.4",
			"4.5",
			"4.6",
			"4.7",
			"4.8",
			"4.9",
		]
		fiveTask = ["空位","任务1","任务2","任务3","任务4","任务5"]
		
		//TODO:UI布局
		makeTitileUI()
		
		spreadsheetView = SpreadsheetView()
		spreadsheetView.frame = CGRect(x:0,y:TitleView.bottom+10,width:self.view.width,height:self.view.height-TitleView.height-60)
		spreadsheetView.backgroundView?.backgroundColor = UIColor.blue
		spreadsheetView.dataSource = self
		spreadsheetView.delegate = self
		
		let hariline = 1/UIScreen.main.scale
		spreadsheetView.intercellSpacing = CGSize(width: hariline, height: hariline)
		spreadsheetView.gridStyle = .solid(width: hariline, color: .lightGray)
		
		spreadsheetView.register(HeaderCell.self, forCellWithReuseIdentifier: String(describing: HeaderCell.self))
		spreadsheetView.register(TextCell.self, forCellWithReuseIdentifier: String(describing: TextCell.self))
		spreadsheetView.register(TaskCell.self, forCellWithReuseIdentifier: String(describing: TaskCell.self))
		spreadsheetView.register(ChartBarCell.self, forCellWithReuseIdentifier: String(describing: ChartBarCell.self))
		self.view.addSubview(TitleView)
		self.view.addSubview(spreadsheetView)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
//		spreadsheetView.flashScrollIndicators()
	}
	func makeTitileUI() -> Void{
		//标题视图
		TitleView.backgroundColor = UIColor.orange
		TitleView.frame = CGRect(x:0,y:0,width:self.view.width,height:45+20+35)
		
		//title
		let TitleLabel = UILabel()
		TitleLabel.backgroundColor = UIColor.white
		TitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
		TitleLabel.text = "习惯养成计划"
		TitleLabel.textColor = UIColor.orange
		TitleLabel.frame = CGRect(x:self.view.frame.origin.x+30 ,y:40,width:self.view.frame.width-60,height:45)
		TitleLabel.textAlignment = NSTextAlignment.center
		
		TitleView.addSubview(TitleLabel)
	}
	//MARK: 协议实现 STRAT -------------
	func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
		return 100
		
	}
	
	func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {

		return 34

	}
	
	func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
		return fiveTask.count
	}
	
	func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
		return leftDate.count
	}
	
	func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
		return 1
	}
	
	func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
		return fiveTask.count
	}
	
	func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
		
		switch (indexPath.column,indexPath.row) {//column: , (row: )
		case (0,0):
			let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
			cell.label.text = "日期/任务"
			cell.gridlines.left = .default
			cell.gridlines.right = .none
			cell.backgroundColor = UIColor.red
			return cell
		case (0,1..<leftDate.count)://日期cell  FIXME：获取日历时间  当月
			let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
			cell.label.text = leftDate[indexPath.row] as? String
			cell.gridlines.left = .default
			cell.gridlines.right = .default
			cell.backgroundColor = UIColor.green
			return cell
		case (1..<fiveTask.count,0)://任务cell
			let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
			cell.label.text = fiveTask[indexPath.column] as? String
			cell.gridlines.left = .default
			cell.gridlines.right = .none
			cell.backgroundColor = UIColor.blue
			return cell
		case (1...5,1...(leftDate.count-1)) ://内容cell  FIXME：改为图片选择
			let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: TextCell.self), for: indexPath) as! TextCell
			cell.label.text = "emoj图片"
			cell.gridlines.left = .default
			cell.gridlines.right = .none
			cell.backgroundColor = UIColor.orange
			return cell
		default:
			return nil
		}
	}
	
	func spreadsheetView(_ spreadsheetView: SpreadsheetView, didSelectItemAt indexPath: IndexPath) {
		print("Selected:（column: \(indexPath.column)）, (row: \(indexPath.row) )")
	}
	//MARK: 协议实现 END -------------
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	

	

	func makeMemoUI() -> Void {
		//FIXME:未实现备注视图
	}
	//MARK:右上角点击事件
	//FIXME: 未实现点击选择日期
		
	

	
}

