    //
    //  ThirdTabScreen.swift
    //  01HW-SwiftUI-Nikitin
    //
    //  Created by Александр Никитин on 03.03.2023.
    //

import SwiftUI

struct ThirdTabScreen: View {
    @State var modalViewIsShow : Bool = false
    @State var someText: String? = nil
    var body: some View {
        
        VStack {
            Spacer()
            TextField(someText: $someText)
                
                .frame(maxWidth: 300, maxHeight: 40)
                .padding()
                .border(.orange)
                .clipped()
            
            
            Spacer()
            Button {
                    // Show modal view
                modalViewIsShow.toggle()
            } label: {
                Text("Show Random Cat \n In Modal View")
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
}




struct ThirdTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdTabScreen()
    }
}

    //MARK: - Обертка для UIKit
struct TextField: UIViewRepresentable {
    
    @Binding var someText: String?
    
    func makeUIView(context: Context) -> UITextField {
        
        let textField = UITextField()
        textField.placeholder = "UIKit TextView"
        return textField
        
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = someText
    }

}
