//
//  FourthScrenn.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 09.03.2023.
//

import SwiftUI
import Networking

struct FourthScreen: View {
    
    @StateObject var newsVM: NewsViewModel = .init()
    
    var body: some View {
        ScrollView {
            list
        }
    }
    
    var list: some View {
        List(newsVM.articles, id: \.self) { article in
            ListArticleCell(title: article.title!, description: article.description!)
        }
        
    }
}

struct ListArticleCell: View {
    let title : String
    let description: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.orange)
            VStack{
                Text(title.isEmpty ? description : title)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .padding()
        .frame(height: 200)
    }
}


struct FourthScrenn_Previews: PreviewProvider {
    static var previews: some View {
        FourthScreen()
    }
}




final class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = .init()
    
    init() {
        ArticlesAPI.everythingGet(q: "Apple VR", apiKey: "4655c692109143a0a81ced3d538d5a95") { data, error in
            print(data?.articles)
            self.articles = (data?.articles)!
        }
    }
    
}
