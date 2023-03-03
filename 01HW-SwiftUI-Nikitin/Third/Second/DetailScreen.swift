//
//  DetailScreen.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 01.03.2023.
//

import SwiftUI

struct DetailScreen: View {
    
    let book : Book
    
    var body: some View {
        VStack(alignment: .leading){
            Image(book.image)
                .resizable()
                .scaledToFit()
            Text(book.name)
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            Text(book.author)
        }
        .ignoresSafeArea()
        .padding()
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(book: Book(name: "Чагин", author: "Евгений Водолазкин", image: "Евгений Водолазкин «Чагин»"))
    }
}
