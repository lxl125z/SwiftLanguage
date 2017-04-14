//
//  ViewController.swift
//  SwiftLanguage
//
//  Created by 刘晓亮(平安万家) on 17/4/14.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let cellReuseIdentifier = "cell"
    fileprivate let titleArray:[(title:String,controller:UIViewController.Type)] = [("错误处理",ErrorHandeController.self)]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        steupTableView()
        
    }
    
    func steupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.tableFooterView = UIView()
    }

}




extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        cell?.textLabel?.text = titleArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = titleArray[indexPath.row].controller.init()
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

