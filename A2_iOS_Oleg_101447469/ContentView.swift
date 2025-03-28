//
//  ContentView.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(product.name ?? "N/A")")
            Text("Description: \(product.desc ?? "N/A")")
            Text("Price: $\(product.price, specifier: "%.2f")")
            Text("Provider: \(product.provider ?? "N/A")")
        }
        .padding()
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Product.entity(), sortDescriptors: []) var products: FetchedResults<Product>
    
    @State private var currentIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                if products.indices.contains(currentIndex) {
                    let product = products[currentIndex]
                    ProductDetailsView(product: product)
                } else {
                    Text("No Products Available")
                        .padding()
                }
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
            
        }.navigationTitle("Product Details")
    }
}


