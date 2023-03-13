//
//  DetailScreen.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 01.03.2023.
//

import SwiftUI
import Networking
import Kingfisher

struct DetailScreen: View {
    
    let cat : Cat
    
    init(with cat: Cat) {
        self.cat = cat
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                if let url = URL(string: cat.url ?? "") {
                    KFImage(url)
                        .placeholder {ProgressView()}
                        .resizable()
                        .scaledToFit()
                        .onAppear()
                    
                }
                if let breeds = cat.breeds?[0] {
                    Text(breeds.name ?? "No Name")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                    Text(breeds.description ?? "No description")
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(with: Cat(id: "123", url: "https://cdn2.thecatapi.com/images/1dn.jpg", breeds: [Breeds(description: "Some Description")]))
    }
}
