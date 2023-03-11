//
//  _1HW_SwiftUI_NikitinApp.swift
//  01HW-SwiftUI-Nikitin
//
//  Created by Александр Никитин on 01.03.2023.
//

import SwiftUI

@main
struct _1HW_SwiftUI_NikitinApp: App {
    
    @StateObject var bookcaseVM: BookcaseViewModel = BookcaseViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(bookcaseVM)
        }
    }
}
