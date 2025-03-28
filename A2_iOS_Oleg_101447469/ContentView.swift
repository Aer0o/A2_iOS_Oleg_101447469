//
//  ContentView.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: StoreProduct.entity(), sortDescriptors: []) var products: FetchedResults<StoreProduct>
    
    @State private var currentIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                if products.indices.contains(currentIndex) {
                    let product = products[currentIndex]
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name: \(product.name ?? "N/A")")
                        Text("Description: \(product.desc ?? "N/A")")
                        Text("Price: $\(product.price, specifier: "%.2f")")
                        Text("Provider: \(product.provider ?? "N/A")")
                    }
                    .padding()
                } else {
                    Text("No Products Available")
                        .padding()
                }
            }
            .navigationTitle("Product Details")
        }
    }
}


