//
//  DCX2022AApp.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/17.
//

import SwiftUI

@main
struct DCX2022AApp: App {
    @StateObject private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
