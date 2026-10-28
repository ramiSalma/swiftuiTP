
import SwiftUI

struct Produit: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let price: Double
    let isAvailable: Bool
    let imageURL: String
}

struct HOFTP3View: View {

    let produits: [Produit] = [
        Produit(
            name: "iPhone 15",
            category: "Phone",
            price: 7500,
            isAvailable: true,
            imageURL: "https://images.unsplash.com/photo-1696446701796-da61225697cc?w=500"
        ),
        Produit(
            name: "MacBook Air",
            category: "Computer",
            price: 12000,
            isAvailable: true,
            imageURL: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500"
        ),
        Produit(
            name: "AirPods",
            category: "Audio",
            price: 1800,
            isAvailable: false,
            imageURL: "https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=500"
        ),
        Produit(
            name: "iPad",
            category: "Tablet",
            price: 4500,
            isAvailable: true,
            imageURL: "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500"
        ),
        Produit(
            name: "Samsung S24",
            category: "Phone",
            price: 9000,
            isAvailable: false,
            imageURL: "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500"
        ),
        Produit(
            name: "Sony Headphones",
            category: "Audio",
            price: 2200,
            isAvailable: true,
            imageURL: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500"
        )
    ]

    var body: some View {
        NavigationStack {
            List {
                // Header
                Section {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Discover")
                                .font(.largeTitle)
                                .fontWeight(.bold)

                            Text("Find your favorite products")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Image(systemName: "bag.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(.white)
                            .frame(width: 58, height: 58)
                            .background(.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 18)
                            )
                    }
                    .padding(.vertical, 12)
                    .listRowSeparator(.hidden)
                }

                // Product list
//                Section("All Products") {
//                    ForEach(produits) { produit in
//                        HStack(spacing: 16) {
//
//                            // Product image
//                            AsyncImage(
//                                url: URL(string: produit.imageURL)
//                            ) { phase in
//                                if let image = phase.image {
//                                    image
//                                        .resizable()
//                                        .scaledToFit()
//                                } else if phase.error != nil {
//                                    Image(systemName: "photo")
//                                        .font(.largeTitle)
//                                        .foregroundStyle(.secondary)
//                                } else {
//                                    ProgressView()
//                                }
//                            }
//                            .frame(width: 100, height: 100)
//                            .background(Color.gray.opacity(0.08))
//                            .clipShape(
//                                RoundedRectangle(cornerRadius: 16)
//                            )
//
//                            // Product information
//                            VStack(alignment: .leading, spacing: 8) {
//                                Text(produit.name)
//                                    .font(.headline)
//                                    .fontWeight(.bold)
//                                    .foregroundStyle(.primary)
//
//                                Text(produit.category)
//                                    .font(.subheadline)
//                                    .foregroundStyle(.secondary)
//
//                                Text(
//                                    produit.price,
//                                    format: .currency(code: "MAD")
//                                        .locale(Locale(identifier: "fr_MA"))
//                                )
//                                .font(.title3)
//                                .fontWeight(.bold)
//                                .foregroundStyle(.blue)
//
//                                // Availability badge
//                                HStack(spacing: 5) {
//                                    Circle()
//                                        .fill(
//                                            produit.isAvailable
//                                            ? Color.green
//                                            : Color.red
//                                        )
//                                        .frame(width: 7, height: 7)
//
//                                    Text(
//                                        produit.isAvailable
//                                        ? "Available"
//                                        : "Out of stock"
//                                    )
//                                    .font(.caption)
//                                    .fontWeight(.medium)
//                                }
//                                .padding(.horizontal, 10)
//                                .padding(.vertical, 6)
//                                .background(
//                                    (produit.isAvailable
//                                     ? Color.green
//                                     : Color.red).opacity(0.10)
//                                )
//                                .clipShape(Capsule())
//                            }
//
//                            Spacer(minLength: 0)
//                        }
//                        .padding(.vertical, 8)
//                        .listRowSeparator(.hidden)
//                    }
//                }
                
                Section("Products list"){
                    ForEach(produits){
                        Produit in
                        VStack(alignment : .leading , spacing : 6){
                            
                            Text(Produit.name)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.primary)
                            
                            Text(Produit.category)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            HStack{
                                Circle()
                                    .fill( Produit.isAvailable ? .green : .red)
                                    .frame(width : 5 , height: 5)
                                
                                Text(Produit.isAvailable ? "Product Available" : "Out Of Stock")
                                    .font(.caption)
                                    .foregroundStyle(Produit.isAvailable ? .green : .red)
                            }
                            
                            
                            
                        }
                    }
                }
                Section("Only Available Products") {
                    ForEach(produits.filter { $0.isAvailable }) { produit in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(produit.name)
                                .font(.headline)

                            Text("\(produit.price, specifier: "%.0f") DH")
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.blue)
                }
            }
        }
        .tint(.blue)
    }
}

#Preview {
    HOFTP3View()
}

