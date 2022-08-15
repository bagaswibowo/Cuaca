//
//  ContentView.swift
//  Cuaca
//
//  Created by Bagas Wibowo on 15/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManger = LocationManager()
    
    
    var body: some View {
        VStack{
            WelcomeView()
                .environmentObject(locationManger)
        }
        .background(Color(hue: 0.594, saturation: 0.69, brightness: 0.807))
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
