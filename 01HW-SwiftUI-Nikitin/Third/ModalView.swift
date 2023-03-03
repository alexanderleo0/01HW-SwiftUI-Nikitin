//
//  ModalView.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 03.03.2023.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var bookcaseVM: BookcaseViewModel
    
    var body: some View {
        ZStack {
            DetailScreen(book: bookcaseVM.bookshelf.randomElement()!)
            VStack{
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.down.square")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(BookcaseViewModel())
    }
}
