    //
    //  ContentView.swift
    //  01HW-SwiftUI-Nikitin
    //
    //  Created by Александр Никитин on 01.03.2023.
    //

import SwiftUI
import Networking
import Kingfisher

struct RootView: View {
    
        // Управляем выбором таба
    @State var tabSelected : Int = 0
    
        // Управляем ручным открытием вкладок на втором табе
    @State var presentedCats: [Cat] = []
    
        //Поддержим устаревшие версии IOS давая возможность открывать вкладки
    @State var presentedCatsIOS15: Cat? = nil
    
    var body: some View {
        TabView(selection: $tabSelected) {
            FirstTabScreen(tabSelected: $tabSelected, presentedCats: $presentedCats, presentedCatsIOS15: $presentedCatsIOS15)
                .tabItem {
                    Image(systemName: "checkerboard.rectangle")
                    Text("First")
                }
                .tag(0)
            SecondTabScreen(presentedCats: $presentedCats, presentedCatsIOS15: $presentedCatsIOS15)
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
        
    }
}

    // MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(CatsViewModel())
    }
}

    // MARK: - ViewModel
final class CatsViewModel: ObservableObject {
    @Published private(set) var catsArray : [Cat] = .init()
    
    init() {
        CatAPI.getSomeCats(apiKey: "live_WqNwVcCYN2xWJt2yfNODEthqOW5JdLu6ujJMIljWzEwGRVR728imSGSIruok6oSR", limit:"30",hasBreeds: "1") { data, error in
            if let cats = data {
                self.catsArray = cats
            }
        }
    }
}

extension Cat: Identifiable {
    public var id : String { self.url ?? "" }
}
