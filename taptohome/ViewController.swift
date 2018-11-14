//
//  ViewController.swift
//  taptohome
//
//  Created by Ryo Ishimoto on 2018/11/10.
//  Copyright © 2018 iryond. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // UIButtonのインスタンスを作成する
        let button = UIButton(type: UIButton.ButtonType.system)
        // ボタンを押した時に実行するメソッドを指定
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        // ラベルを設定する
        button.setTitle("ボタンのテキスト", for: UIControl.State.normal)
        // サイズを決める(自動調整)
        button.sizeToFit()
        // 位置を決める(画面中央)
        button.center = self.view.center
        // サイズを変更する
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        
        // 任意の場所に設置する
        button.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        
        // 文字色を変える
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        // 背景色を変える
        button.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.6, alpha: 1)
        
        // 枠の太さを変える
        button.layer.borderWidth = 1.0
        
        // 枠の色を変える
        button.layer.borderColor = UIColor(red: 0.3, green: 0.6, blue: 0.5, alpha: 1).cgColor
        
        // 枠に丸みをつける
        button.layer.cornerRadius = 25
        
        // 影の濃さを決める
        button.layer.shadowOpacity = 0.5
        
        // 影のサイズを決める
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        // ボタンが押されたときのラベル
        button.setTitle("押された！", for: UIControl.State.highlighted)

        // viewに追加する
        self.view.addSubview(button)
        

    }
    
    // ボタンタップ時に実行するメソッド
    @objc func buttonEvent(_ sender: UIButton) {
        /*
        let camera = GMSCameraPosition.camera(withLatitude: 35.729698, longitude: 139.710962, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 35.729698, longitude: 139.710962)
        marker.title = "Tokyo"
        marker.snippet = "Japan"
        marker.map = mapView
        */
        let url = NSURL(string: "http://maps.google.com/maps?f=d&daddr=Tokyo+Tower,+Tokyo,+Japan&sll=35.6586,139.7454&sspn=0.2,0.1&nav=1")
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

