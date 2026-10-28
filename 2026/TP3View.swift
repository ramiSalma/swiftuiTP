//
//  TP3View.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct TP3View: View {
    
    let colors: [Color] = [
        .blue, .purple, .orange, .green, .pink , .black
        ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0..<colors.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colors[index])
                        .frame(height: 150)
                        .overlay {
                            Text("Card \(index + 1)")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TP3View()
}
