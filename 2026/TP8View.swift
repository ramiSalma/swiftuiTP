
import SwiftUI

struct User: Identifiable {
    let id: Int
    var name: String
    var age: Int
}

struct TP8View: View {

    let users: [User] = [
        User(id: 1, name: "Sara", age: 22),
        User(id: 2, name: "Youssef", age: 25),
        User(id: 3, name: "Amine", age: 20)
    ]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    private let blue = Color(red: 0.15, green: 0.35, blue: 0.85)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("USER DIRECTORY")
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(3)
                        .foregroundStyle(.white.opacity(0.8))

                    Text("Users List")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Text("Manage and discover your users.")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))

                    HStack {
                        Image(systemName: "person.3.fill")
                            .font(.title2)

                        Text("\(users.count) Members")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(24)
                .background(
                    LinearGradient(
                        colors: [blue, Color.cyan.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 28))

                // Section title
                HStack {
                    Text("All Members")
                        .font(.title2)
                        .fontWeight(.bold)

                    Spacer()

                    Text(" \(users.count) ")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(blue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(blue.opacity(0.1))
                        .clipShape(Capsule())
                }

                // User cards
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(users) { user in
                        VStack(spacing: 14) {

                            // Avatar
                            ZStack {
                                Circle()
                                    .fill(blue.opacity(0.12))
                                    .frame(width: 68, height: 68)

                                Text(String(user.name.prefix(1)).uppercased())
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(blue)
                            }

                            // Name
                            Text(user.name)
                                .font(.headline)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)

                            // Age badge
                            HStack(spacing: 5) {
                                Image(systemName: "calendar")
                                Text("\(user.age) years")
                            }
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Capsule())
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 155)
                        .padding(12)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .overlay {
                            RoundedRectangle(cornerRadius: 22)
                                .strokeBorder(
                                    Color.gray.opacity(0.12),
                                    lineWidth: 1
                                )
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Color(uiColor: .systemGroupedBackground))
    }
}

#Preview {
    TP8View()
}

