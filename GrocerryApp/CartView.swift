//
//  CartView.swift
//  GrocerryApp
//
//  Created by Kiran Sonne on 01/08/24.
//

import SwiftUI

struct CartView: View {
    @State private var totalPrice = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("My Cart")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            List{
                ForEach(0..<cartItems.endIndex, id:\.self){  item in
                    HStack{
                        Image(cartItems[item][0] as! String)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 5){
                            Text(cartItems[item][1] as! String)
                            Text("Rs. \(cartItems[item][2] as! Int)")
                                .foregroundStyle(.gray)
                         }
                    }
                    
                }.onDelete(perform: { indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    self.calculateTotalPrice()
                })
            }
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.green)
                    .opacity(0.8)
                    .frame(width: 350,height: 120)
                VStack(spacing: 10){ 
                    Text("Total Price")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    Text("Rs. \(totalPrice)")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                 }
                Button(){
                    dismiss()
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder()
                            .frame(width: 120, height: 50)
                            .foregroundStyle(.white)
                        Text("Pay Now")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }.offset(x: 80)
            }
        }.onAppear(perform: {
            calculateTotalPrice()
        })
    }
    func calculateTotalPrice(){
        totalPrice = 0
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Int
            
        }
    }
}

#Preview {
    CartView()
}
