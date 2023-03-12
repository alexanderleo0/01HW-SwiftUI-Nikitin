    //
    //  SecondTabScreen.swift
    //  01HW-SwiftUI-Nikitin
    //
    //  Created by Александр Никитин on 03.03.2023.
    //

import SwiftUI
import Networking
import Kingfisher

struct SecondTabScreen: View {
    
    @Binding var presentedCats: [Cat]
    @Binding var presentedCatsIOS15 : Cat?
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavStackIOS16(presentedCats: $presentedCats)
        } else {
            NavViewIOS15(presentedCatsIOS15: $presentedCatsIOS15)
        }
    }
}

    // MARK: - NavView For iOS 16
struct NavStackIOS16: View {
    
    @EnvironmentObject var catVM: CatsViewModel
    @Binding var presentedCats: [Cat]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $presentedCats) {
                List(catVM.catsArray) { cat in
                    NavigationLink(value: cat) {
                        CatCell(with: cat)
                    }
                }
                .navigationTitle("Cats")
                .navigationDestination(for: Cat.self) { cat in
                    DetailScreen(with: cat)
                }
            }
        }
    }
}
    // MARK: - NavView For iOS 15
struct NavViewIOS15: View {
    @EnvironmentObject var catsVM: CatsViewModel
    @Binding var presentedCatsIOS15: Cat?
    
    var body: some View {
        NavigationView {
            List(catsVM.catsArray) { cat in
                NavigationLink(destination: DetailScreen(with: cat),
                               tag: cat,
                               selection: $presentedCatsIOS15) {
                    CatCell(with: cat)
                    
                }
            }
            .navigationTitle("My Books")
        }
    }
}

    // MARK: - CELL
struct CatCell: View {
    
    let cat: Cat
    
    init(with cat: Cat) {
        self.cat = cat
    }
    
    var body: some View {
        HStack {
            if let url = URL(string: cat.url ?? ""){
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 60, maxHeight: 60)
                
            }
            VStack(alignment: .leading) {
                if let breed = cat.breeds?[0] {
                    Text(breed.name ?? "No Name")
                        .font(.system(.title2))
                    Text(breed.altNames ?? "")
                        .font(.system(.headline))
                        .foregroundColor(.secondary)
                    
                }
            }
        }
    }
}

    // MARK: - Preview
struct SecondTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabScreen(presentedCats: RootView().$presentedCats, presentedCatsIOS15: RootView().$presentedCatsIOS15)
            .environmentObject(CatsViewModel())
    }
}
