//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 15/12/2566 BE.
//

import SwiftUI
import Alamofire
import ObjectMapper

class WeatherViewModel: ObservableObject {
    @Published var weather: CurrentWeatherResponse?
    @Published var forecast: ForecastWeatherResponse?
    @Published var error: Error?
    
    private let weatherAPI = WeatherAPI.shared
    
    func getWeatherData(city: String) {
        weatherAPI.getCurrentWeather(city: city) { [weak self] (response, error) in
            if let response = response {
                self?.weather = response
            } else if let error = error {
                self?.error = error
            }
        }
    }
    
    func getForecastWeatherData(city: String) {
        weatherAPI.getForecastWeather(city: city) { [weak self] (response, error) in
            if let response = response {
                self?.forecast = response
            } else if let error = error {
                self?.error = error
            }
        }
    }
    
    func formattedTemperature(_ temperature: Double, isCelsius: Bool) -> String {
        let formattedTemp = String(format: "%.2f", isCelsius ? convertToCelsius(temperature) : convertToFahrenheit(temperature))
        return "\(formattedTemp) \(isCelsius ? "°C" : "°F")"
    }
    
    private func convertToCelsius(_ kelvin: Double) -> Double {
        return kelvin - 273.15
    }
    
    private func convertToFahrenheit(_ celsius: Double) -> Double {
        return (celsius - 273.15) * 9/5 + 32
    }
    
}

