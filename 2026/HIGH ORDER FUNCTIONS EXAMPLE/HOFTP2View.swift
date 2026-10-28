//
//  HOFTP2View.swift
//  2026
//
//  Created by Bits on 15/10/2026.
//

import SwiftUI

struct HOFTP2View: View {
    let prices = [40 , 50 , 60 , 120 , 100 , 55 , 150 , 180]
    
    var body: some View {
        // ========= FILTER EXAMPLE
        ForEach( prices.filter{ $0 < 100 } , id : \.self){ price in
            Text("\(price) MAD")
        }
    }
}

#Preview {
    HOFTP2View()
}
