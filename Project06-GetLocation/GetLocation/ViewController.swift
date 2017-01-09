//
//  ViewController.swift
//  GetLocation
//
//  Created by Lelouch on 2017/1/4.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var buttomBlurView: UIVisualEffectView!
    @IBOutlet weak var getLocationButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    var locationManager = CLLocationManager()
    var currLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickGetLocationButton(_ sender: Any) {
        
        self.loadLocation()
        
    }
    
    
    func loadLocation() {
        
        locationManager.delegate = self
        //定位方式
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let system = UIDevice.current.systemVersion
        
        print(system)
        //iOS8.0以上才可以使用
        if((system as NSString).doubleValue >= 8.0){
            //始终允许访问位置信息
            locationManager.requestAlwaysAuthorization()
            //使用应用程序期间允许访问位置数据
            locationManager.requestWhenInUseAuthorization()
        }
        //开启定位
        locationManager.startUpdatingLocation()
    }
    
    
    
    //获取定位信息
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //取得locations数组的最后一个
        let location:CLLocation = locations[locations.count-1]
        currLocation = locations.last!
        //判断是否为空
        if(location.horizontalAccuracy > 0){
            let lat = Double(String(format: "%.1f", location.coordinate.latitude))
            let long = Double(String(format: "%.1f", location.coordinate.longitude))
            print("纬度:\(long!)")
            print("经度:\(lat!)")
            LonLatToCity()
            //停止定位
            locationManager.stopUpdatingLocation()
        }
        
    }
    
    //出现错误
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        print(error!)
    }
    
    ///将经纬度转换为城市名
    func LonLatToCity() {
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(currLocation) { (placemark, error) -> Void in
            
            if(error == nil) {
                
                let array = placemark! as NSArray
                let mark = array.firstObject as! CLPlacemark
                //城市
                let city: String = (mark.addressDictionary! as NSDictionary).value(forKey: "City") as! String
                //国家
                let country: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "Country") as! NSString
                //国家编码
//                let CountryCode: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "CountryCode") as! NSString
                //街道位置
                let FormattedAddressLines: NSString = ((mark.addressDictionary! as NSDictionary).value(forKey: "FormattedAddressLines") as AnyObject).firstObject as! NSString
                //具体位置
            
//                let Name: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "Name") as! NSString
                //省
                let State: String = (mark.addressDictionary! as NSDictionary).value(forKey: "State") as! String
                //区
                let SubLocality: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "SubLocality") as! NSString
                
                
                
                self.locationLabel.text = "\(country), \(State), \(city)"
                
            } else {
                
                print(error!)
                
            }
        }
    }
}
