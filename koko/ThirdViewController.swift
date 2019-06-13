//
//  ThirdViewController.swift
//  koko
//
//  Created by Lisa Smolentseva on 25/04/2019.
//  Copyright © 2019 Lisa Smolentseva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import UserNotifications

class ThirdViewController: UIViewController {

    @IBOutlet weak var weatherResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func fahrenheitToCelsius(temp: Double) -> Double {
        return  (temp - 32.0) * (5.0/9.0)
    }
    
    func showAlert(city: String, cityWeather: Double) {
        print("cucumber")
        let content = UNMutableNotificationContent()
        content.title = "В городе \(city)"
        content.body = "Погода \(cityWeather) C˚"
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }

    @IBOutlet weak var cityLabel: UILabel!
    @IBAction func WeatherActionButton(_ sender: Any) {
//        let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22")!
//
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                let str = String(data: data, encoding: .utf8)
//                guard let aStr = str else { return }
//                self.weatherResult.text = aStr
//            }
//        }
//        task.resume()
    
       let url = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
        
        
        
        AF.request(url).responseJSON { response in
            //            print(response)
            guard let data = response.data else { return }
            let json = try! JSON(data: data)
            let temp = json["main"]["temp"].doubleValue
            let name = json["name"].stringValue
            self.cityLabel.text = name
            self.showAlert(city: name, cityWeather: self.fahrenheitToCelsius(temp: temp))
            DispatchQueue.main.async {
                self.weatherResult.text = "Current weather: \(self.fahrenheitToCelsius(temp: temp))"
               
            }
            
    }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}


