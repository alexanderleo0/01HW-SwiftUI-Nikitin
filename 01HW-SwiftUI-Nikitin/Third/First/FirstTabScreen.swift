//
//  FirstTabScreen.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 03.03.2023.
//

import SwiftUI

struct FirstTabScreen: View {
    
    @EnvironmentObject var bookcaseVM: BookcaseViewModel
    
    //Переключение табов
    @Binding var tabSelected: Int
    
    //Говорим какую книгу хотии увидеть
    @Binding var presentedBooks: [Book]
    @Binding var presentedNumberIOS15 : Book?
    
    var body : some View {
        
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)], spacing: 3) {
                ForEach(bookcaseVM.bookshelf) { book in
                    Button{
                        tabSelected = 1
                        if #available(iOS 16.0, *) {
                            presentedBooks = []
                            presentedBooks.append(book)
                        } else {
                            presentedNumberIOS15 = book
                        }
                    } label: {
                        Image(book.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                    }
                }
            }
        }
    }
}

struct FirstTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabScreen(tabSelected: RootView().$tabSelected, presentedBooks: RootView().$presentedBooks, presentedNumberIOS15: RootView().$presentedNumberIOS15)
            .environmentObject(BookcaseViewModel())
    }
}
