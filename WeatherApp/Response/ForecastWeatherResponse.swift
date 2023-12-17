//
//  ForecastWeatherResponse.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 15/12/2566 BE.
//

import ObjectMapper


class ForecastWeatherResponse: Mappable {
    var cod: String?
    var message: Int?
    var count: Int?
    var list: [WeatherData]?
    var city: City?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        count <- map["cnt"]
        list <- map["list"]
        city <- map["city"]
    }
}


class WeatherData: Mappable {
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
    var visibility: Int?
    var pop: Int?
    var sys: Sys?
    var dtTxt: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        wind <- map["wind"]
        visibility <- map["visibility"]
        pop <- map["pop"]
        sys <- map["sys"]
        dtTxt <- map["dt_txt"]
    }
}






