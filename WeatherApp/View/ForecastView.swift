//
//  ForecastView.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 16/12/2566 BE.
//

import SwiftUI

struct ForecastView: View {
    let forecast: ForecastWeatherResponse
    
    var body: some View {
        Section{
            
            HStack {
                Spacer()
                
                VStack(spacing: -10) {
                    Text("Forecast")
                        .font(.system(size: 66, weight: .black))
                    Text("5 Days")
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
            .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
            .padding(.top, 8)
        }
        Section{
            if let forecastList = forecast.list {
                ForEach(0..<forecastList.count, id: \.self) { index in
                    if index % 8 == 0 {
                        let weatherDetail = forecastList[index]
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Date: \(formattedDate(weatherDetail.dtTxt))").customTextForecastStyle()
                                    
                                    Text("Temperature: \(String(format: "%.1f", (weatherDetail.main?.temp ?? 0.0) - 273.15))°C").customTextForecastStyle()
                                    
                                    Text("Humidity: \(weatherDetail.main?.humidity ?? 0)%").customTextForecastStyle()
                                    
                                    Divider().background().hidden()
                                }
                                Image("\(String(describing: weatherDetail.weather?.first?.icon ?? ""))")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                        }
                        .padding()
                        .background(LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                    }
                }
            } else {
                Text("No forecast available")
            }
        }
    }
    
    
    private func formattedDate(_ dateString: String?) -> String {
        guard let dateString = dateString else { return "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = " dd EEEE"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
}


