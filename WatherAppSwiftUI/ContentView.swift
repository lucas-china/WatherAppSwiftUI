//
//  ContentView.swift
//  WatherAppSwiftUI
//
//  Created by Lucas Santana Brito on 13/06/23.
//

import SwiftUI

struct Colors {
    var topColor: Color
    var bottomColor: Color
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var lightMode: Colors
    var darkMode: Colors
        
    var body: some View {
        LinearGradient(
            colors: [
                isNight ? darkMode.topColor : lightMode.topColor,
                isNight ? darkMode.bottomColor : lightMode.bottomColor
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct TitleView: View {
    var cityName: String
    
    var body: some View {
        Text(
            cityName
        )
        .font(
            .system(
                size: 32,
                weight: .medium,
                design: .default
            )
        )
        .foregroundColor(.white)
        .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(
                systemName: imageName
            )
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
            
            Text(
                "\(temperature)°"
            )
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
            .padding(.bottom, 40)
        }
    }
}

struct WheatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(
                dayOfWeek
            )
            .font(.system(size: 16, weight: .medium, design: .default))
            .foregroundColor(.white)
            Image(
                systemName: imageName
            )
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            Text(
                "\(temperature)°"
            )
            .font(.system(size: 28, weight: .medium))
            .foregroundColor(.white)
        }
    }
}

struct WeatherButton: View {
    var body: some View {
        Text(
            "Change day time"
        )
        .frame(width: 280, height: 50)
        .background(Color.white)
        .font(.system(size: 20, weight: .bold, design: .default))
        .cornerRadius(10.0)
    }
}

struct ContentView: View {
    @State private var isNight: Bool = false
    
    private let lightMode = Colors(
        topColor: .blue,
        bottomColor: Color("lightBlue")
    )
    private let darkMode = Colors(
        topColor: .black,
        bottomColor: .gray
    )
    
    
    var body: some View {
        ZStack {
            BackgroundView(
                isNight: $isNight,
                lightMode: lightMode,
                darkMode: darkMode
            )
            VStack {
                TitleView(cityName: "Teresina, PI")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 28)

                HStack(spacing: 20) {
                    WheatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 28
                    )
                    WheatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 28
                    )
                    WheatherDayView(
                        dayOfWeek: "THU",
                        imageName: "sun.max.fill",
                        temperature: 28
                    )
                    WheatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sun.max.fill",
                        temperature: 28
                    )
                    WheatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "wind",
                        temperature: 28
                    )
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
