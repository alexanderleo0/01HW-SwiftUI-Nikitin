//
//  ThirdTabScreen.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 03.03.2023.
//

import SwiftUI

struct ThirdTabScreen: View {
    @State var modalViewIsShow : Bool = false
    var body: some View {
        
        Button {
            // Show modal view
            modalViewIsShow.toggle()
        } label: {
            Text("Select Random Book")
                .foregroundColor(.white)
        }
        .padding()
        .background {
            Color.orange
        }
        .cornerRadius(15)
        
        .sheet(isPresented: $modalViewIsShow, content: {
            ModalView()
        })
    }
        
}




struct ThirdTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdTabScreen()
    }
}
