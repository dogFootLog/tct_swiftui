//
//  DCX001.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/21.
//

import SwiftUI


struct DCX001: View {
    @EnvironmentObject var model: ViewModel
    @State var isExpanded: Bool
    
    var filteredList: [DataModel1] {
        model.shopList.filter { shop in
            guard let filter = model.filter else {
                return true
            }
            return shop.category == filter
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("마곡 요기서 배달")
                    .font(.title)
                    .padding()
                        
                VStack {
                    HStack {
                        FilterButton(label: "전체", category: nil, filter: $model.filter)
                        Spacer()
                        FilterButton(label: "치킨", category: .ck, filter: $model.filter)
                        Spacer()
                        FilterButton(label: "피자", category: .pz, filter: $model.filter)
                        Spacer()
                        FilterButton(label: "분식", category: .sf, filter: $model.filter)
                        Spacer()
                        FilterButton(label: "카페", category: .cf, filter: $model.filter)
                    }.padding()
                    
                    HStack {
                        SortButton(label: "기본 정렬순", option: $model.sortOption, key: .id)
                        Spacer()
                        SortButton(label: "별점 높은순", option: $model.sortOption, key: .point)
                        Spacer()
                        SortButton(label: "리뷰 많은순", option: $model.sortOption, key: .review)
                    }.padding()
                    
                    CustomDisclosureGroup(isExpanded: $isExpanded) {
                        isExpanded.toggle()
                    } prompt: {
                        HStack(spacing: 0) {
                            Text("How to open an account in your application?")
                            Spacer()
                            Text(">")
                                .fontWeight(.bold)
                                .rotationEffect(isExpanded ? Angle(degrees: 90) : .zero)
                        }
                        .padding(.horizontal, 20)
                    } expandedView: {
                        Text("you can open an account by choosing between gmail or ICloud when opening the application")
                            .font(.system(size: 16, weight: .semibold, design: .monospaced))
                    }
                }
                        
                List(filteredList) { data in
                    NavigationLink {
                        DCX002()
                            .environmentObject(model)
                            .onAppear{
                                model.loadShopDetail("http://localhost:3300/dcx/1/shopDetail/\(data.id)")
                            }
                    } label: {
                        ListRow(data: data)
                    }
                }
            }
        }
    }
}

struct ListRow2: View {
    var data: DataModel1
    
    var body: some View {
        HStack {
            Text(data.name)
        }
    }
}

struct ListRow: View {
    var data: DataModel1
    
    var body: some View {
        HStack {
            Image(String(data.imageFile.split(separator: ".")[0]))
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(data.name)
                        .bold()
                    
                    if data.adFlag == "Y" {
                        Image("ad")
                    }
                }
                
                Text("별점 \(String(data.point)), 리뷰 \(data.review)")
            }
        }
    }
}

struct SortButton: View {
    var label: String
    @Binding var option: SortOption
    var key: SortOption
    
    var body: some View {
        Button(action: {
            option = key
        }) {
            Text(label)
                .foregroundColor(option == key ? .red : .blue)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct FilterButton: View {
    var label: String
    var category: Category?
    @Binding var filter: Category?
    
    var body: some View {
        Button {
            filter = category
        } label: {
            Text(label)
                .foregroundColor(filter == category ? .red : .blue)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct DCX001_Previews: PreviewProvider {
    static var previews: some View {
        DCX001(isExpanded: false)
            .environmentObject(ViewModel())
    }
}
