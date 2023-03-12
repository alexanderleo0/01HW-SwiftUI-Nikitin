//
//  ModalView.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 03.03.2023.
//

import SwiftUI
import Networking

struct ModalView: View {
    
//    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var catsVM: CatsViewModel
    
    var body: some View {
        ZStack {
            if let cat = catsVM.catsArray.randomElement() {
                DetailScreen(with: cat)
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
            .environmentObject(CatsViewModel())
    }
}
