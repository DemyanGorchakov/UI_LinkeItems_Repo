//
//  LinkShowView.swift
//  UI_Notes_App
//
//  Created by Демьян Горчаков on 04.03.2023.
//

import SwiftUI

struct LinkShowView: View {
    
    @State var url = ""
    @State var title = ""
    @State var isLoaded = false
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Google")
                    .fontWeight(.bold)
                Circle()
                    .frame(width: 20)
                    .foregroundColor(isLoaded ? .green : .red)
                    .shadow(color: .black.opacity(0.6), radius: 3, x: 2, y: 2)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color("BlueBgd"))
            
            WebView(openUrl: $url, isLoaded: { isOpen in
                self.isLoaded = isOpen
            })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LinkShowView_Previews: PreviewProvider {
    static var previews: some View {
        LinkShowView()
    }
}
