//
//  ConvertButton.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 17/12/2566 BE.
//

import SwiftUI

struct ConvertButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            
            Text("Convert")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .tint(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
    }
}

