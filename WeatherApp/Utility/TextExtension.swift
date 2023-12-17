//
//  TextExtension.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 17/12/2566 BE.
//

import Foundation
import SwiftUI

extension Text {
    func customTextStyle() -> some View {
        self.fontWeight(.black)
            .font(.system(size: 20))
            .lineLimit(nil)
            .minimumScaleFactor(0.5)
            .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
    }
    
    func customTextTitleStyle() -> some View {
        self.fontWeight(.black)
            .font(.system(size: 30))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
            .textCase(.uppercase)
    }
    
    func customTextForecastStyle() -> some View {
        self.fontWeight(.black)
            .font(.subheadline)
            .lineLimit(nil)
            .minimumScaleFactor(0.5)
            .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
    }
}
