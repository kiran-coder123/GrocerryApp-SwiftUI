//
//  ShopView.swift
//  GrocerryApp
//
//  Created by Kiran Sonne on 01/08/24.
//

import SwiftUI

var shopItems: [[Any]] = [
    ["apple", "Apple", 100, Color.green],
    ["banana", "Banana", 200, Color.yellow],
    ["cake", "Cake", 300, Color.purple],
    ["chips", "Chips", 400, Color.brown],
    ["water", "Water", 500, Color.blue],
    ["avocado5", "Avocado", 500, Color.green],
]

var cartItems:[[Any]] = []

struct ShopView: View {
    @State var addToCart: Bool = false
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var items: [[Any]] = shopItems
    
    var body: some View {
        VStack(spacing: 5){
            VStack{
                Text("Good Morning,")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(.gray)
                Text("Let's order fresh\nitems for you")
                    .font(.system(size: 38, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                Spacer().frame(height: 75)
                Text("Fresh Items")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(.gray)
            }.padding(20)
            ScrollView(){
                LazyVGrid(columns: columns,spacing: 30) {
                    ForEach(0..<items.count, id: \.self){ item in
                        ShopItemView(imageName: items[item][0] as! String, title: items[item][1] as! String, price: items[item][2] as! Int, color: items[item][3] as! Color, selfIndex: item)
                    }
                }.padding(15)
            }
            .navigationDestination(isPresented: $addToCart){
                CartView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(){
                        addToCart = true
                    }label: {
                        Image(systemName: "cart")
                    }
                    
                }         
            }
        }
    }
}

#Preview {
    ShopView()
}
