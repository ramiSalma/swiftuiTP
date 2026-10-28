//
//  ProductView.swift
//  2026
//
//  Created by Bits on 15/10/2026.
//

import SwiftUI



struct ProductView: View {
    @State private var products: [Product] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading products...")
                } else if let errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(products) { product in
                                VStack(alignment: .leading, spacing: 8) {
                                    AsyncImage(
                                        url: URL(string: product.thumbnail)
                                    ) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(height: 130)

                                    Text(product.title)
                                        .font(.headline)
                                        .lineLimit(2)

                                    Text(
                                        product.price,
                                        format: .currency(code: "USD")
                                    )
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green)
                                }
                                .padding()
                                .background(
                                    Color.gray.opacity(0.1)
                                )
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 12)
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("My Store")
            .task {
                await loadProducts()
            }
        }
    }

    @MainActor
    private func loadProducts() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            products = try await ProductService().fetchProducts()
        } catch {
            errorMessage = "Could not load products."
        }
    }
    
    }
#Preview {
    ProductView()
}
