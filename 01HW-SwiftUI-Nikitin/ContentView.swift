//
//  ContentView.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 01.03.2023.
//

import SwiftUI


struct ContentView: View {
    
    // Управляем выбором таба
    @State var tabSelected : Int = 0
    
    // Управляем ручным открытием вкладок на втором табе
    @State var presentedBooks: [Book] = []
    
    //Поддержим устаревшие версии IOS давая возможность открывать вкладки
    @State var presentedNumberIOS15: Book? = nil
    
    @EnvironmentObject var bookcaseVM: BookcaseViewModel
    
    var body: some View {
        TabView(selection: $tabSelected) {
            FirstTabScreen(tabSelected: $tabSelected, presentedBooks: $presentedBooks, presentedNumberIOS15: $presentedNumberIOS15)
                .tabItem {
                    Image(systemName: "checkerboard.rectangle")
                    Text("First")
                }
                .tag(0)
            SecondTabScreen(presentedBook: $presentedBooks, presenedNumbersIOS15: $presentedNumberIOS15)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Second")
                }
                .tag(1)
            ThirdTabScreen()
                .tabItem {
                    Image(systemName: "mount")
                    Text("Third")
                }
                .tag(2)
        }
        .accentColor(.orange)
        .environmentObject(BookcaseViewModel())
        
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Model
struct Book: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let author: String
    let image: String
}

// MARK: - ViewModel
class BookcaseViewModel: ObservableObject {
    @Published private(set) var bookshelf = [
        Book(name: "Перекрестки", author: "Джонатан Франзен", image: "Джонатан Франзен «Перекрестки»"),
        Book(name: "Подлинная история Анны Карениной", author: "Павел Басинский", image: "Павел Басинский «Подлинная история Анны Карениной»"),
        Book(name: "Прекрасный мир, где же ты", author: "Салли Руни", image: "Салли Руни «Прекрасный мир, где же ты»"),
        Book(name: "Чагин", author: "Евгений Водолазкин", image: "Евгений Водолазкин «Чагин»"),
        Book(name: "Чумные ночи", author: "Орхан Памук", image: "Орхан Памук «Чумные ночи»"),
        Book(name: "Воровка фруктов", author: "Петер Хандке", image: "Петер Хандке «Воровка фруктов»"),
        Book(name: "Протагонист", author: "Ася Володина" , image: "Ася Володина «Протагонист»"),
        Book(name: "От первого лица", author: "Харуки Мураками", image: "Харуки Мураками «От первого лица»"),
        Book(name: "Две недели в сентябре", author: "Р.С. Шерифф", image: "Р.С. Шерифф «Две недели в сентябре»")
    ]
}



