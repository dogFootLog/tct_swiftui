//
//  ContentView.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/17.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        DCX001()
            .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
