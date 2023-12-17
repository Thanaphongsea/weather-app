//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 15/12/2566 BE.
//

import Foundation
import Combine
import Alamofire
import ObjectMapper

class WeatherAPI: ObservableObject {
    
    private let apiKey = "ba645376a2fb0de510b1f2875875a0c8"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/"
    static let shared = WeatherAPI()
    
    
    func getCurrentWeather(city: String, completion: @escaping (CurrentWeatherResponse?, Error?) -> Void) {
        let url = "\(baseUrl)weather?q=\(city)&appid=\(apiKey)"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let weatherResponse = try Mapper<CurrentWeatherResponse>().map(JSONString: String(data: data, encoding: .utf8)!)
                        completion(weatherResponse, nil)
                    } catch let error {
                        print("Error mapping JSON: \(error)")
                        completion(nil, error)
                    }
                }
            case .failure(let error):
                print("Error making request: \(error)")
                completion(nil, error)
            }
        }
    }
    
    func getForecastWeather(city: String, completion: @escaping (ForecastWeatherResponse?, Error?) -> Void) {
        let url = "\(baseUrl)forecast?q=\(city)&appid=\(apiKey)"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let weatherResponse = try Mapper<ForecastWeatherResponse>().map(JSONString: String(data: data, encoding: .utf8)!)
                        completion(weatherResponse, nil)
                    } catch let error {
                        print("Error mapping JSON: \(error)")
                        completion(nil, error)
                    }
                }
            case .failure(let error):
                print("Error making request: \(error)")
                completion(nil, error)
            }
        }
    }
}
