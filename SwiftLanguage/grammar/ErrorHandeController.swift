//
//  ViewController.swift
//  SwiftLanguage
//
//  Created by 刘晓亮(平安万家) on 17/4/14.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class ErrorHandeController: UIViewController {
    
    enum TestError: Error {
        case test01
        case test02(Int)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        errorOptionTry()
        
    }
}

extension ErrorHandeController{
    //创建带有错误处理的函数
    @discardableResult
    func test(num:Int) throws ->Int{
        
        defer {
            print("1")
        }
        defer {
            print("2")
        }
        if num == 0{
            throw TestError.test01
        }else if num == 1{
            throw TestError.test02(num)
        }else{
            print("没有错误抛出")
            return num
        }
    }
}

extension ErrorHandeController{
    
    // 1、用函数传递错误
    func errorTransmit() throws{
        try test(num:3)
    }
    
    //2、DO-Catch 处理
    func errorCatch(){
        do{
            try test(num:3)
        }catch{
            print("出现异常")
        }
    }
    //3、try?忽略错误
    func errorOptionTry(){
        _ = try? test(num:3)
    }
    
    //4、try!对于确定不会出错的可以这样做
    func errorTry(){
        try! test(num:3)
    }
    
}



