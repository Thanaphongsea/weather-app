//
//  Response.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 15/12/2566 BE.
//

import ObjectMapper

struct Coord: Mappable {
    var lon: Double?
    var lat: Double?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }
}

struct Weather: Mappable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}

struct Main: Mappable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?
    var seaLevel: Int?
    var grndLevel: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        seaLevel <- map["sea_level"]
        grndLevel <- map["grnd_level"]
    }
}

struct Wind: Mappable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
        gust <- map["gust"]
    }
}

struct Clouds: Mappable {
    var all: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        all <- map["all"]
    }
}

struct Sys: Mappable {
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}


class City: Mappable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    var timezone: Int?
    var sunrise: Int?
    var sunset: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        country <- map["country"]
        population <- map["population"]
        timezone <- map["timezone"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
