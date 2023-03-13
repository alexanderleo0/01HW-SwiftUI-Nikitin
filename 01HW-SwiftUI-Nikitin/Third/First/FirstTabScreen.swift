    //
    //  FirstTabScreen.swift
    //  01HW-SwiftUI-Nikitin
    //
    //  Created by Александр Никитин on 03.03.2023.
    //

import SwiftUI
import Networking
import Kingfisher

struct FirstTabScreen: View {
    
    @EnvironmentObject var catsVM: CatsViewModel
    
        //Переключение табов
    @Binding var tabSelected: Int
    
        //Говорим какую книгу хотии увидеть
    @Binding var presentedCats: [Cat]
    @Binding var presentedCatsIOS15 : Cat?
    
    var body : some View {
        if catsVM.catsArray.count == 0 {
            ProgressView()
                .scaleEffect(3)
        } else {
            ScrollView {
                
                LazyVGrid(columns: Array(repeating: .init(), count: 3), spacing: 6) {
                    
                    ForEach(catsVM.catsArray) { cat in
                        Button{
                            tabSelected = 1
                            if #available(iOS 16.0, *) {
                                presentedCats = []
                                presentedCats.append(cat)
                            } else {
                                presentedCatsIOS15 = cat
                            }
                        } label: {
                            if let url = URL(string: cat.url ?? ""){
                                KFImage(url)
                                    .resizable()
                                    .placeholder {ProgressView()}
                                    .aspectRatio(contentMode: .fill)
                                    //                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                
                                    .clipped()
                                    .onAppear()
                            }
                        }
                    }
                    Text("")
                    ProgressView()
                        .scaleEffect(2)
                        .onAppear {
                            if catsVM.catsArray.count != 0 {
                                catsVM.fetchCats()
                            }
                        }
                        .frame(height: 100)
                        
                    
                }
                .padding(.horizontal, 6)
                
                
            }
        }
    }
}

struct FirstTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabScreen(tabSelected: RootView().$tabSelected, presentedCats: RootView().$presentedCats, presentedCatsIOS15: RootView().$presentedCatsIOS15)
            .environmentObject(CatsViewModel())
        
    }
}
