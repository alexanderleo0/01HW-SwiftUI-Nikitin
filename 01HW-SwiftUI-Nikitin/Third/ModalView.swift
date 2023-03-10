//
//  ModalView.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 03.03.2023.
//

import SwiftUI

struct ModalView: View {
    
//    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var bookcaseVM: BookcaseViewModel
    
    var body: some View {
        ZStack {
            if let book = bookcaseVM.bookshelf.randomElement() {
                DetailScreen(book: book)
                VStack {
                    HStack{
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
//                            dismiss()
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
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(BookcaseViewModel())
    }
}
