//
//  ViewController.swift
//  taptohome
//
//  Created by Ryo Ishimoto on 2018/11/10.
//  Copyright © 2018 iryond. All rights reserved.
//

import UIKit
import GoogleMaps
import Direction

class ViewController: UIViewController, UITextFieldDelegate, GMSMapViewDelegate {

    var mapView:GMSMapView!
    var coordinates: [CLLocationCoordinate2D] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ボタンの表記を配列で作成
        let arrayDestination = ["Home","Office"]
        //UISegmentedControlのインスタンス作成
        let segmentDestination: UISegmentedControl = UISegmentedControl(items: arrayDestination as [AnyObject])
        // サイズを決める(自動調整)
        segmentDestination.sizeToFit()
        // 位置を決める(画面中央)
        segmentDestination.center = self.view.center
        // サイズを変更する
        segmentDestination.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        //segmentの位置を設定
        segmentDestination.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2.5)
        //デフォルト値を自宅に設定
        segmentDestination.selectedSegmentIndex=0
        //ボタンを押した時の処理を設定
        segmentDestination.addTarget(self, action: #selector(changeDst(_:)), for: UIControl.Event.valueChanged)
        // viewに追加する
        self.view.addSubview(segmentDestination)

        //ボタンの表記を配列で作成
        let arrayMode = ["Car","Train","Walking"]
        //UISegmentedControlのインスタンス作成
        let segmentMode: UISegmentedControl = UISegmentedControl(items: arrayMode as [AnyObject])
        // サイズを決める(自動調整)
        segmentMode.sizeToFit()
        // 位置を決める(画面中央)
        segmentMode.center = self.view.center
        // サイズを変更する
        segmentMode.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        //segmentの位置を設定
        segmentMode.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        //デフォルト値を車に設定
        segmentMode.selectedSegmentIndex=0
        //ボタンを押した時の処理を設定
        segmentMode.addTarget(self, action: #selector(changeMode(_:)), for: UIControl.Event.valueChanged)
        // viewに追加する
        self.view.addSubview(segmentMode)

        // UIButtonのインスタンスを作成する
        let button = UIButton(type: UIButton.ButtonType.system)
        // ボタンを押した時に実行するメソッドを指定
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        // ラベルを設定する
        button.setTitle("way to home", for: UIControl.State.normal)
        // サイズを決める(自動調整)
        button.sizeToFit()
        // 位置を決める(画面中央)
        button.center = self.view.center
        // サイズを変更する
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        // 任意の場所に設置する
        button.layer.position = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 1.5)
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
    @objc func changeDst(_ sender: UISegmentedControl) {
        let myVar = GlobalVar.shared
        switch sender.selectedSegmentIndex {
        case 0:
            myVar.directionDst="Home"
        case 1:
            myVar.directionDst="Work"
        default:
            print("")
        }
    }
    @objc func changeMode(_ sender: UISegmentedControl) {
        let myVar = GlobalVar.shared
        switch sender.selectedSegmentIndex {
        case 0:
            myVar.directionMode="driving"
        case 1:
            myVar.directionMode="transit"
        case 2:
            myVar.directionMode="walking"
        default:
            print("")
        }
    }
    
    // ボタンタップ時に実行するメソッド
    @objc func buttonEvent(_ sender: UIButton) {
        let myVar = GlobalVar.shared
        let testURL = URL(string: "comgooglemaps-x-callback://")!
        if UIApplication.shared.canOpenURL(testURL) {
            let directionsRequest = "comgooglemaps-x-callback://" +
                "?daddr=" + myVar.directionDst +
                "&directionsmode=" + myVar.directionMode +
            "&x-success=sourceapp://?resume=true&x-source=AirApp"
            
            let directionsURL = URL(string: directionsRequest)!
            UIApplication.shared.open(directionsURL, options: [:], completionHandler: nil)
        } else {
            NSLog("Can't use comgooglemaps-x-callback:// on this device.")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

