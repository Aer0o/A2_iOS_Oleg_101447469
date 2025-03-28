//
//  ContentView.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
    ) var products: FetchedResults<Product>

    @State private var currentIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                if products.indices.contains(currentIndex) {
                    let product = products[currentIndex]
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name: \(product.name ?? "N/A")")
                            .font(.title2)
                        Text("Description: \(product.desc ?? "N/A")")
                        Text("Price: $\(product.price, specifier: "%.2f")")
                        Text("Provider: \(product.provider ?? "N/A")")
                    }
                    .padding()
                } else {
                    Text("No Products Available")
                        .foregroundColor(.gray)
                        .padding()
                }

                HStack {
                    Button("Previous") {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }
                    .disabled(currentIndex == 0)

                    Button("Next") {
                        if currentIndex < products.count - 1 {
                            currentIndex += 1
                        }
                    }
                    .disabled(currentIndex >= products.count - 1)
                }
                .padding()

                NavigationLink("Add Product", destination: AddProductView())
                    .padding()

                NavigationLink("View All Products", destination: ProductListView())
                    .padding()
            }
            .navigationTitle("Product Details")
        }
    }
}


