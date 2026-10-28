
import SwiftUI

struct TP1View: View {
    var body: some View {
        ZStack {
            Color.black

            VStack(spacing: 25) {

                HStack(spacing: 15) {
                    Text("SR")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 60, height: 60)
                        .background(.blue)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Salma Rami")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)

                        Text("Développeuse Web & Mobile")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                    }

                    Spacer()
                }

                Divider()
                    .overlay(.white.opacity(0.5))

                HStack {
                    VStack {
                        Text("3")
                            .font(.title2)
                            .bold()
                        Text("Projets")
                    }

                    Spacer()

                    VStack {
                        Text("4")
                            .font(.title2)
                            .bold()
                        Text("Compétences")
                    }

                    Spacer()

                    VStack {
                        Text("2")
                            .font(.title2)
                            .bold()
                        Text("Formations")
                    }
                }
                .foregroundStyle(.white)

                Button {
                    print("Voir mon portfolio")
                } label: {
                    Text("Voir mon portfolio")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                }
            }
            .padding(20)
        }
        .frame(height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}

#Preview {
    TP1View()
}
