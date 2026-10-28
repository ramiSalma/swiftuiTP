
import SwiftUI

struct PeopleView: View {
    @State private var people: [Person] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var searchText = ""

    private let peopleService = PeopleService()

    private var filteredPeople: [Person] {
        guard !searchText.isEmpty else {
            return people
        }

        return people.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.email.localizedCaseInsensitiveContains(searchText) ||
            $0.phone.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                content
            }
            .navigationTitle("People")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $searchText,
                prompt: "Search people..."
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            await loadUsers()
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .disabled(isLoading)
                    .accessibilityLabel("Refresh people")
                }
            }
            .task {
                if people.isEmpty {
                    await loadUsers()
                }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if isLoading && people.isEmpty {
            ProgressView("Loading people...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        } else if let errorMessage, people.isEmpty {
            VStack(spacing: 16) {
                Image(systemName: "wifi.exclamationmark")
                    .font(.system(size: 42))
                    .foregroundStyle(.secondary)

                Text("Unable to Load People")
                    .font(.title3.bold())

                Text(errorMessage)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                Button {
                    Task {
                        await loadUsers()
                    }
                } label: {
                    Label("Try Again", systemImage: "arrow.clockwise")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.blue, in: Capsule())
                }
            }
            .padding(28)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        } else if filteredPeople.isEmpty {
            ContentUnavailableView.search(text: searchText)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        } else {
            List {
                Section {
                    ForEach(filteredPeople) { person in
                        personRow(person)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                } header: {
                    HStack {
                        Text("ALL PEOPLE")
                            .font(.caption.bold())
                            .tracking(1)

                        Spacer()

                        Text("\(filteredPeople.count) people")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 8)
                }
            }
            .listStyle(.plain)
            .refreshable {
                await loadUsers()
            }
        }
    }

    private func personRow(_ person: Person) -> some View {
        HStack(spacing: 14) {
            // Avatar
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.12))

                Text(initials(for: person.name))
                    .font(.headline.bold())
                    .foregroundStyle(.blue)
            }
            .frame(width: 54, height: 54)

            // Person information
            VStack(alignment: .leading, spacing: 7) {
                Text(person.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Label(person.email, systemImage: "envelope")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)

                Label(person.phone, systemImage: "phone")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer(minLength: 0)

            Image(systemName: "chevron.right")
                .font(.caption.bold())
                .foregroundStyle(.tertiary)
        }
        .padding(14)
        .background(
            Color(.secondarySystemGroupedBackground),
            in: RoundedRectangle(cornerRadius: 18)
        )
        .padding(.vertical, 4)
    }

    private func initials(for name: String) -> String {
        let parts = name.split(separator: " ")

        let result = parts.prefix(2).compactMap {
            $0.first.map(String.init)
        }

        return result.joined().uppercased()
    }

    @MainActor
    private func loadUsers() async {
        guard !isLoading else { return }

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            people = try await peopleService.fetchPeople()
        } catch {
            errorMessage = "Failed to load people. Please try again."
        }
    }
}

#Preview {
    PeopleView()
}
