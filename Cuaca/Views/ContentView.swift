//
//  ContentView.swift
//  Cuaca
//
//  Created by Bagas Wibowo on 15/08/22.
// 

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather {
                    Text("Data Cuaca diambil")
                }
                else{
                    LoadingView()
                        .task {
                            do{
                                try await
                                weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude) 
                                
                                
                            }catch{
                                print("Tidak mendapatkan data cuaca: \(error)")
                            }
                        }
                }
            } else{
                if locationManager.isLoading{
                    LoadingView()
                } else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.624, saturation: 0.992, brightness: 0.38))
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
