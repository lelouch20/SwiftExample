//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Lelouch on 2017/1/5.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = UITableView()
    var refreshControl = UIRefreshControl()
    let data1 = ["😀😀😀😀😀",
                "🐶🐶🐶🐶🐶",
                "🎾🎾🎾🎾🎾",
                "🥝🥝🥝🥝🥝",
                "🏄🏄🏄🏄🏄"
    ]
    let data2 = ["🐸🐸🐸🐸🐸",
                 "🚕🚕🚕🚕🚕",
                 "📷📷📷📷📷",
                 "❤️❤️❤️❤️❤️",
                 "🚩🚩🚩🚩🚩",
                 "👿👿👿👿👿",
                 "📕📕📕📕📕"]

    let reuseIdnetifier = "cell"
    var dataList = [String]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "RefreshControlDemo"
        self.initTableView()
        refreshControl.addTarget(self, action: #selector(refreshToLoadData), for: UIControlEvents.valueChanged)
        let attributes = NSMutableAttributedString.init(string: "Loading...")
        attributes.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location: 0, length: 10))
        refreshControl.attributedTitle = attributes
        list.refreshControl = refreshControl
        
        refreshToLoadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initTableView() {
        
        list.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        list.dataSource = self
        list.delegate = self
        list.separatorStyle = UITableViewCellSeparatorStyle.none
        list.backgroundColor = UIColor.black
        list.register(listTableViewCell.self, forCellReuseIdentifier: reuseIdnetifier)
        self.view.addSubview(list)
        
    }
    
    func refreshToLoadData() {
        
        dataList = (count % 2 == 1) ? data2 : data1
        count += 1
    
        let indexSet = NSIndexSet.init(index: 0)
        list.reloadSections(indexSet as IndexSet, with: UITableViewRowAnimation.fade)
        refreshControl.endRefreshing()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataList.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120.0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdnetifier) as? listTableViewCell
        
        cell?.textLab?.text = dataList[indexPath.row]
        
        return cell!
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

