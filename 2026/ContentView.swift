import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                NavigationLink("Go to TP1") {
                    TP1View()
                }

                NavigationLink("Go to TP2") {
                    TP2View()
                }

                NavigationLink("Go to TP3") {
                    TP3View()
                }
                NavigationLink("Go to TP4"){
                    TP4View()
                }
                NavigationLink("Go to TP6"){
                    TP6View()
                }

            }
            .buttonStyle(.borderedProminent)
            .navigationTitle("Main Menu")
        }
    }
}
