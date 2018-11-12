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
        
        // ツールバーを作成
        let toolBar: UIView = UIView()
        toolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 45)
        toolBar.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
        // テキストフィールドを作成
        let barTextField: UITextField = UITextField()
        barTextField.frame = CGRect(x: 5, y: 5, width: self.view.frame.width - 65, height: 35)
        barTextField.placeholder = "コメント..."
        barTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        // ボタンを作成
        let barButton: UIButton = UIButton(type: UIButton.ButtonType.system)
        barButton.frame = CGRect(x: barTextField.frame.width + 10, y: 5, width: 50, height: 35)
        barButton.setTitle("送信", for: UIControl.State.normal)
        barButton.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        
        /*
        // アイテムをツールバーに追加
        toolBar.addSubview(barTextField)
        toolBar.addSubview(barButton)
        
        // ツールバーをビューに設定
        textField.inputAccessoryView = toolBar
        textField.delegate = self
        */
    }
    
    // ボタンタップ時に実行するメソッド
    @objc func buttonEvent(_ sender: UIButton) {
        let camera = GMSCameraPosition.camera(withLatitude: 35.729698, longitude: 139.710962, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 35.729698, longitude: 139.710962)
        marker.title = "Tokyo"
        marker.snippet = "Japan"
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

