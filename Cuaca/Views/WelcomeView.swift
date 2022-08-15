//
//  WelcomeView.swift
//  Cuaca
//
//  Created by Bagas Wibowo on 15/08/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager : LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing:30){
                Text("Selamat Datang di Aplikasi Cuaca")
                    .bold().font(.title)
                Text("Silahkan hidupkan lokasi anda untuk bisa mengakses keadaan cuaca di sekitar")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
