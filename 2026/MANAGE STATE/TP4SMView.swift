
import SwiftUI

struct TP4SMView: View {
    @State private var mode = false

    var body: some View {
        
        VStack{
            Text("LIGHT MODE DARK MODE TOGGLE")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(mode ? .white : .black)
            
            Button("dark mode"){
                mode.toggle()
                
            }
            .padding()
            .foregroundStyle(mode ? .black : .white)
            .background(mode ? .white : .black)
            
        }
        .frame(maxWidth : .infinity , maxHeight : .infinity)
        .background(mode ? .black : .white)
        
    }
}

#Preview {
    TP4SMView()
}
