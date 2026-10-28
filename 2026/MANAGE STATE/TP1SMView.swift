//
//  TP1SMView.swift
//  2026
//
//  Created by Bits on 21/10/2026.
//

import SwiftUI

struct TP1SMView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("counter : \(count)")
            
            Button("increase"){
                count += 1
            }
            
            Button("decrease"){
                count -= 1
            }
            
        }
    }
}

#Preview {
    TP1SMView()
}
