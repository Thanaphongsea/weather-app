//
//  SearchButton.swift
//  WeatherApp
//
//  Created by ธนพงษ์ แจ้งสว่าง on 16/12/2566 BE.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(LinearGradient(colors: [.white, .customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
            Circle()
                .stroke(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom),
                        lineWidth: 4)
            Image(systemName: "magnifyingglass")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
        }
        .frame(width: 60, height: 60)
    }
}

#Preview {
    SearchButton()
        .previewLayout(.sizeThatFits)
        .padding()
}
