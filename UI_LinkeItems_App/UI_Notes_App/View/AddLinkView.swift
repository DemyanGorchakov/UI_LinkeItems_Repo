//
//  AddLinkView.swift
//  UI_Notes_App
//
//  Created by Демьян Горчаков on 04.03.2023.
//

import SwiftUI
import RealmSwift

struct AddLinkView: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    @ObservedResults(LinkItem.self) var linkItems
    
    @State var linkTitle = ""
    @State var linkUrl = ""
    
    var body: some View {
        VStack{
            VStack(spacing: 40){
                HStack{
                    Spacer()
                    Button {
                        contentViewModel.addViewIsOpen = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                VStack(spacing: 10) {
                    TextField("Link Title", text: $linkTitle)
                        .padding(20)
                        .background(Color("Text"))
                        .cornerRadius(10)
                    TextField("Link Url", text: $linkUrl)
                        .padding(20)
                        .background(Color("Text"))
                        .cornerRadius(10)
                }
            }
            Spacer()
            Button {
                let linkItem = LinkItem()
                linkItem.title = linkTitle
                linkItem.url = linkUrl
                $linkItems.append(linkItem)
                contentViewModel.addViewIsOpen = false
            } label: {
                Text("Save")
                    .frame(width: 250)
                    .padding(11)
                    .background(Color("Button"))
                    .cornerRadius(20)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(.white)
    }
}

struct AddLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddLinkView()
    }
}
