//
//  DCX002.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/22.
//

import SwiftUI

struct DCX002: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        Text("\(model.shopDetail?.name ?? "tt") & \(model.shopDetail?.distance ?? "mm")")
    }
}

struct DCX002_Previews: PreviewProvider {
    static var previews: some View {
        DCX002()
            .environmentObject(ViewModel())
    }
}
