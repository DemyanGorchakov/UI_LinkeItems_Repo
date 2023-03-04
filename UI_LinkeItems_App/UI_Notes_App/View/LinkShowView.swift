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
    
    var body: some View {
        VStack{
            HStack{
            }
            WebView(openUrl: $url)
                .frame(width: .infinity, height: .infinity)
        }
    }
}

struct LinkShowView_Previews: PreviewProvider {
    static var previews: some View {
        LinkShowView()
    }
}
