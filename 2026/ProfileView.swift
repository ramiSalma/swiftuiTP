import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("profile")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .scaledToFit()
                .clipped()
                .overlay {
                        Circle()
                            .stroke(.blue, lineWidth: 4)
                    }
                .shadow(radius: 8)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 50))
                .foregroundStyle(.red)
            
            Text("SWIFTUI COURSE")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(3)
                .foregroundStyle(.blue)

            Text("Learn SwiftUI")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.primary)

            Text("Build beautiful iOS applications step by step.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.horizontal)

            Text("START LEARNING")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
        }
        .padding()
    }
}
