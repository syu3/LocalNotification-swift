//
//  ViewController.swift
//  LocalNotification-swift
//
//  Created by 加藤 周 on 2015/03/09.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myNotificationButton: UIButton!
    var myNotificationFireButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().registerUserNotificationSettings(
            UIUserNotificationSettings(
                forTypes:UIUserNotificationType.Sound | UIUserNotificationType.Alert,
                categories: nil)
        )
        
        
        // すぐにNotificationを発火するボタンを作成する.
        myNotificationButton = UIButton(frame: CGRectMake(0,0,200,80))
        myNotificationButton.backgroundColor = UIColor.orangeColor()
        myNotificationButton.layer.masksToBounds = true
        myNotificationButton.setTitle("Notification", forState: .Normal)
        myNotificationButton.layer.cornerRadius = 20.0
        myNotificationButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        myNotificationButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myNotificationButton.tag = 1
        
        // 時間をおいてNotificationを発火するボタンを作成する.
        myNotificationFireButton = UIButton(frame: CGRectMake(0,0,200,80))
        myNotificationFireButton.backgroundColor = UIColor.blueColor()
        myNotificationFireButton.layer.masksToBounds = true
        myNotificationFireButton.setTitle("Notification(Fire)", forState: .Normal)
        myNotificationFireButton.layer.cornerRadius = 20.0
        myNotificationFireButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:400)
        myNotificationFireButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myNotificationFireButton.tag = 2
        
        // ViewにButtonを追加する.
        view.addSubview(myNotificationButton)
        view.addSubview(myNotificationFireButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func onClickMyButton(sender: UIButton){
        if sender.tag == 1 {
            showNotification()
        } else if sender.tag == 2 {
            showNotificationFire()
        }
    }
    
    /*
    Show Notification
    */
    private func showNotification(){
        
        // Notificationの生成する.
        let myNotification: UILocalNotification = UILocalNotification()
        
        // メッセージを代入する.
        myNotification.alertBody = "TEST"
        
        // Timezoneを設定をする.
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        // Notificationを表示する.
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
    }
    
    /*
    Show Notification(10 sec後に発火)
    */
    private func showNotificationFire(){
        
        // Notificationの生成する.
        let myNotification: UILocalNotification = UILocalNotification()
        
        // メッセージを代入する.
        myNotification.alertBody = "TEST(Fire)"
        
        // 再生サウンドを設定する.
        myNotification.soundName = UILocalNotificationDefaultSoundName
        
        // Timezoneを設定する.
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        // 10秒後に設定する.
        myNotification.fireDate = NSDate(timeIntervalSinceNow: 2)
        
        // Notificationを表示する.
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
    }


}

