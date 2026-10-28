
import SwiftUI

struct ProductItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let description: String
    let quantity: Int
    let category: String
}

struct TP6SMView: View {

    @State private var productName = ""
    @State private var productPrice: Double = 0
    @State private var productDescription = ""
    @State private var productQuantity = 1
    @State private var selectedCategory = "Clothes"

    private let categories = [
        "Clothes", "Electricity", "Food", "Household", "Others"
    ]

    // Initial list of products
    @State private var products: [ProductItem] = [
        ProductItem(
            name: "T-Shirt",
            price: 120,
            description: "Cotton T-shirt",
            quantity: 10,
            category: "Clothes"
        ),
        ProductItem(
            name: "Jeans",
            price: 250,
            description: "Blue denim jeans",
            quantity: 5,
            category: "Clothes"
        ),
        ProductItem(
            name: "Headphones",
            price: 350,
            description: "Wireless headphones",
            quantity: 8,
            category: "Electricity"
        ),
        ProductItem(
            name: "Laptop",
            price: 6500,
            description: "Laptop for work and study",
            quantity: 3,
            category: "Electricity"
        ),
        ProductItem(
            name: "Milk",
            price: 8,
            description: "One liter of fresh milk",
            quantity: 20,
            category: "Food"
        ),
        ProductItem(
            name: "Bread",
            price: 2,
            description: "Fresh bread",
            quantity: 15,
            category: "Food"
        ),
        ProductItem(
            name: "Cleaning Spray",
            price: 35,
            description: "Household cleaning product",
            quantity: 6,
            category: "Household"
        ),
        ProductItem(
            name: "Notebook",
            price: 15,
            description: "A4 school notebook",
            quantity: 12,
            category: "Others"
        )
    ]

    var body: some View {
        NavigationStack {
            Form {

                // Add product form
                Section("ADD NEW PRODUCT") {

                    TextField("Product Name", text: $productName)

                    TextField(
                        "Product Price",
                        value: $productPrice,
                        format: .number
                    )
                    .keyboardType(.decimalPad)

                    TextField(
                        "Product Description",
                        text: $productDescription
                    )

                    Stepper(
                        "Quantity: \(productQuantity)",
                        value: $productQuantity,
                        in: 1...100
                    )

                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }

                    Button("Add Product") {
                        addProduct()
                    }
                    .disabled(
                        productName.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).isEmpty
                    )
                }

                // Display all products, including newly added ones
                Section("PRODUCTS (\(products.count))") {

                    if products.isEmpty {
                        Text("No products available")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(products) { product in
                            VStack(alignment: .leading, spacing: 6) {

                                Text(product.name)
                                    .font(.headline)

                                Text(product.description)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)

                                HStack {
                                    Text(
                                        product.price,
                                        format: .currency(code: "MAD")
                                    )

                                    Spacer()

                                    Text("Qty: \(product.quantity)")
                                }
                                .font(.subheadline)

                                Text("Category: \(product.category)")
                                    .font(.caption)
                                    .foregroundStyle(.blue)
                            }
                            .padding(.vertical, 5)
                        }
                        .onDelete { indexSet in
                            products.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Product Manager")
        }
    }

    private func addProduct() {
        let newProduct = ProductItem(
            name: productName,
            price: productPrice,
            description: productDescription,
            quantity: productQuantity,
            category: selectedCategory
        )

        // Append the new product to the existing list
        products.append(newProduct)

        // Reset the form
        productName = ""
        productPrice = 0
        productDescription = ""
        productQuantity = 1
        selectedCategory = "Clothes"
    }
}

#Preview {
    TP6SMView()
}
