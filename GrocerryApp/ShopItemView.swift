//
//  ShopItemView.swift
//  GrocerryApp
//
//  Created by Kiran Sonne on 01/08/24.
//

import SwiftUI

struct ShopItemView: View {
    var imageName: String
    var title: String
    var price: Int
    var color: Color
    var selfIndex: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(color)
                .opacity(0.25)
                .frame(width: 170, height: 230)
            VStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(title)
                Button(){
                    cartItems.append(shopItems[selfIndex])
                }label: {
                    Text("ADD \(price)")
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 40)
                        .background(color)
                }
            }
        }
    }
}

#Preview {
    ShopItemView(imageName: "avocado", title: "Avocado", price: 250, color: Color.green, selfIndex: 0)
}
