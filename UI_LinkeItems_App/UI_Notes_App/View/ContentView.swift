//
//  ContentView.swift
//  UI_Notes_App
//
//  Created by Демьян Горчаков on 02.03.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedObject var contentViewModel = ContentViewModel()
    @ObservedResults(LinkItem.self) var linkItems
    @State var data = []
    
    var body: some View {
        
        ZStack{
            NavigationView {
                List {
                    ForEach(linkItems, id: \.self) { item in
                        NavigationLink {
                            LinkShowView(url: item.url, title: item.title)
                        } label: {
                            Text(item.title)
                        }
                    }
                    .onDelete { index in
                        $linkItems.remove(atOffsets: index)
                    }
                }
                .navigationBarItems(trailing: addButton())
                .navigationTitle("MyLinks")
                .navigationBarTitleDisplayMode(.large)
            }
            if contentViewModel.addViewIsOpen {
                AddLinkView()
                    .environmentObject(contentViewModel)
            }
        }
    }
    
    @ViewBuilder
    func addButton() -> some View {
        
        Button {
            contentViewModel.addViewIsOpen = true
        } label: {
            ZStack{
                Circle()
                    .frame(width: 30)
                    .foregroundColor(Color("Button"))
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
