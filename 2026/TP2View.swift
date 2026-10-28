//
//  TP2View.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct TP2View: View {
    let fruits = ["Apple", "Banana", "Orange", "Grapes"]
    var body: some View {
        
        
        List {
            Text("Accueil")
                .font(.headline)
                .foregroundStyle(.blue)

            Text("Profil")
                .font(.title3)

            Text("Paramètres")
                .foregroundStyle(.secondary)
        }
        
        List {
                    ForEach(fruits, id: \.self) { fruit in
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundStyle(.green)

                            Text(fruit)
                                .font(.headline)

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding(.vertical, 6)
                    }
                }
                .listStyle(.insetGrouped)
    }
}

#Preview {
    TP2View()
}
