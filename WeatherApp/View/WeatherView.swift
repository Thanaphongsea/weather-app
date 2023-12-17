//
//  WeatherView.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 16/12/2566 BE.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject private var viewModel = WeatherViewModel()
    @State private var cityName = "Bangkok"
    @State private var cityNameSearch = ""
    @State private var isShowingSheet: Bool = false
    @State private var isCelsius = true
    let currentDate = Date()
    
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            VStack {
                
                Spacer()
                
                let formattedDateString = formattedDate(date: currentDate)
                Text(formattedDateString).customTextTitleStyle()
                
                HStack {
                    TextField("Search City", text: $cityNameSearch)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                    
                    Button{
                        viewModel.getWeatherData(city: cityNameSearch)
                        viewModel.getForecastWeatherData(city: cityNameSearch)
                        cityNameSearch = ""
                    }label: {
                        SearchButton()
                    }
                }
                
                Text("\(String(describing: viewModel.weather?.weather?.first?.description ?? ""))").customTextTitleStyle()
                Text("City: \(String(describing: viewModel.weather?.name ?? ""))").customTextStyle()
                
                ZStack(alignment: .center) {
                    Image("\(String(describing: viewModel.weather?.weather?.first?.icon ?? ""))")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .padding()
                
                VStack(alignment: .leading){
                    
                    Text("Temperature: \(formattedTemperature())").customTextStyle()
                    Text("TempeMax: \(formattedTemperatureMax())").customTextStyle()
                    Text("TempMin: \(formattedTemperatureMin())").customTextStyle()
                    Text("Pressure: \(viewModel.weather?.main?.pressure ?? 0)").customTextStyle()
                    Text("Humidity: \(viewModel.weather?.main?.humidity ?? 0)%").customTextStyle()
                    
                    Divider().background().hidden()
                }
                .padding(.horizontal, 30)
                
                HStack{
                    ConvertButton{
                        toggleTemperatureUnit()
                    }
                    Button{
                        print("The button was pressed.")
                        isShowingSheet.toggle()
                        
                    }label: {
                        ForecastButton()
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        if let forecast = viewModel.forecast{ ForecastView(forecast: forecast)
                                .presentationDragIndicator(.visible)
                            .presentationDetents([.large,.large])}
                    }
                }
            }
            .padding()
            .onAppear {
                viewModel.getWeatherData(city: cityName)
                viewModel.getForecastWeatherData(city: cityName)
            }
        }
        .frame(width: 320, height: 570)
    }
    
    private func formattedTemperatureMax() -> String {
        let temperature = viewModel.weather?.main?.tempMax ?? 0.0
        return viewModel.formattedTemperature(temperature, isCelsius: isCelsius)
    }
    
    private func formattedTemperatureMin() -> String {
        let temperature = viewModel.weather?.main?.tempMin ?? 0.0
        return viewModel.formattedTemperature(temperature, isCelsius: isCelsius)
    }
    
    private func formattedTemperature() -> String {
        let temperature = viewModel.weather?.main?.temp ?? 0.0
        return viewModel.formattedTemperature(temperature, isCelsius: isCelsius)
    }
    
    private func toggleTemperatureUnit() {
        isCelsius.toggle()
    }
    
    private func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd EEEE yyyy"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    WeatherView()
}
