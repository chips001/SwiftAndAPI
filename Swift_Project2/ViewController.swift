//
//  ViewController.swift
//  Swift_Project2
//
//  Created by 一木　英希 on 2017/10/06.
//  Copyright © 2017年 一木　英希. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mNameField: UITextField!
    @IBOutlet weak var mPwField: UITextField!
    @IBOutlet weak var mSendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mSendBtnAction(_ sender: Any) {
        
        //requestとなるJSONを生成
        let nameText:String = mNameField.text!
        let pwText:String = mPwField.text!
        
        let sendDataStr = String(format: "{ \"contact\": { \"name\":\"%@\", \"password\":\"%@\" } }", nameText, pwText).data(using: String.Encoding.utf8)
        
        //接続設定
        let apiUrl = URL(string:"http://localhost:3000/contacts.json")
        var request = URLRequest(url:apiUrl!)
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = sendDataStr
        
        //通信処理の実行
        URLSession.shared.dataTask(with: request){(data, response, err) in
            if (err == nil){
                //通信成功
                print("succcess")
            }else{
                print("error")

            }
        }.resume()
    }
}
