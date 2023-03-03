//
//  SecondTabScreen.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 03.03.2023.
//

import SwiftUI

struct SecondTabScreen: View {
    
    @Binding var presentedBook: [Book]
    @Binding var presenedNumbersIOS15: Book?
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavStackIOS16(presentedBook: $presentedBook)
        } else {
            NavViewIOS15(presenedNumbersIOS15: $presenedNumbersIOS15)
        }
    }
}

// MARK: - NavView For iOS 16
struct NavStackIOS16: View {
    @EnvironmentObject var bookcaseVM: BookcaseViewModel
    @Binding var presentedBook: [Book]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $presentedBook) {
                List(bookcaseVM.bookshelf) { book in
                    NavigationLink(value: book) {
                        BookCell(book: book)
                    }
                }
                .navigationTitle("My Books")
                .navigationDestination(for: Book.self) { book in
                    DetailScreen(book: book)
                }
            }
        }
    }
}
// MARK: - NavView For iOS 15
struct NavViewIOS15: View {
    @EnvironmentObject var bookcaseVM: BookcaseViewModel
    @Binding var presenedNumbersIOS15: Book?
    
    var body: some View {
        NavigationView {
            List(bookcaseVM.bookshelf) { book in
                NavigationLink(destination: DetailScreen(book: book),
                               tag: book,
                               selection: $presenedNumbersIOS15) {
                    BookCell(book: book)
                }
            }
            .navigationTitle("My Books")
        }
    }
}

// MARK: - CELL
struct BookCell: View {
    
    let book: Book
    
    var body: some View {
        HStack {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 60, maxHeight: 60)
            VStack(alignment: .leading) {
                Text(book.name)
                    .font(.system(.title2))
                Text(book.author)
                    .font(.system(.headline))
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Preview
struct SecondTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabScreen(presentedBook: ContentView().$presentedBooks, presenedNumbersIOS15: ContentView().$presentedNumberIOS15)
            .environmentObject(BookcaseViewModel())
    }
}
