//
//  WebViewExtencion.swift
//  UI_Notes_App
//
//  Created by Демьян Горчаков on 04.03.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    @Binding var openUrl: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        if let url = URL(string: openUrl) {
            let openUrl = URLComponents(url: url, resolvingAgainstBaseURL: true)
            let request = URLRequest(url: openUrl?.url ?? url)
            webView.load(request)
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}
