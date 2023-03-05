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
    @State var isLoaded: (Bool) -> ()
    
    func makeUIView(context: Context) -> WKWebView {
        
        let webView = WKWebView()
        
        webView.navigationDelegate = context.coordinator
        
        if let url = URL(string: openUrl) {
            let openUrl = URLComponents(url: url, resolvingAgainstBaseURL: true)
            let request = URLRequest(url: openUrl?.url ?? url)
            webView.load(request)
        }
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator { isLoaded in
            self.isLoaded(isLoaded)
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    final class Coordinator: NSObject, WKNavigationDelegate {
        
        var isLoaded: (Bool) -> ()
        
        init(isLoaded: @escaping (Bool) -> Void) {
            self.isLoaded = isLoaded
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            isLoaded(true)
        }
    }
}
