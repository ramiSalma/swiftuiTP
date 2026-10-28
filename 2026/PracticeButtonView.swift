//
//  PracticeButtonView.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct PracticeButtonView: View {
    var body: some View {
        Button("click me button"){
            print("I am a Button")
        }
        .font(.title)
        .padding()
        .background(.green)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius:   10))
        
        
        Button("Disabled-looking") {}
            .padding()
            .background(.purple)
            .foregroundColor(.white)
            .font(.title).bold()
            .opacity(0.5)
            
        
        
        
        VStack(spacing: 15) {
            Button("Default") {}
                .buttonStyle(.automatic)

            Button("Bordered") {}
                .buttonStyle(.bordered)

            Button("Prominent") {}
                .buttonStyle(.borderedProminent)

            Button("Plain") {}
                .buttonStyle(.plain)
        }
        .tint(.blue)
            
        
        
        Button("Pay Now") {
            print("Payment started")
        }
        .disabled(true)
            
        
        VStack {
            Button("Small") {}
                .controlSize(.small)

            Button("Regular") {}
                .controlSize(.regular)

            Button("Large") {}
                .controlSize(.large)
        }
        .buttonStyle(.borderedProminent)
            
        
        
        
        VStack(spacing: 20) {

            Button {
                print("Add clicked")
            } label: {
                Label("Add Product", systemImage: "plus")
            }

            Button {
                print("Delete clicked")
            } label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
                .foregroundStyle(.white)
                .padding()
                .background(.red)
                .clipShape(Capsule())
            }

            Button {
                print("Favorite clicked")
            } label: {
                Image(systemName: "heart.fill")
                    .font(.system(size: 28))
                    .foregroundStyle(.pink)
            }
        }
        .padding()

    }
}

#Preview {
    PracticeButtonView()
}
