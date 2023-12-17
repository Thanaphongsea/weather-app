//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 16/12/2566 BE.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

#Preview {
    BackgroundView()
        .padding()
}
