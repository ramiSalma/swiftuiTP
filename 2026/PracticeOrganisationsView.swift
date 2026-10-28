//
//  PracticeOrganisationsView.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct PracticeOrganisationsView: View {
    var body: some View {
        
        
        VStack(
            alignment: .center ,
            spacing: 30
        ) {
            Text("Bonjour")
            Text("Bienvenue")
            Text("SwiftUI")
        }
        
        
        
        HStack(spacing: 15) {
            Image(systemName: "house.fill")

            Text("Accueil")

            Image(systemName: "chevron.right")
        }
        .font(.title2)
        .padding()

        
        
        ZStack {
            Color.blue

            VStack {
                Image(systemName: "mountain.2.fill")
                    .font(.system(size: 60))

                Text("Discover Morocco")
                    .font(.title)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .frame(height: 250)

        
        
        HStack {
            Text("Mon profil")

            Spacer()

            Image(systemName: "gearshape")
        }
        .padding()

        
        
        VStack(alignment: .leading, spacing: 15) {
            Text("Mon compte")

            Divider()

            Text("Notifications")

            Divider()

            Text("Confidentialité")
        }
        .padding()


    }
}

#Preview {
    PracticeOrganisationsView()
}
