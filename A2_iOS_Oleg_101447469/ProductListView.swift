//
//  ProductListView.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import SwiftUI

struct ProductListView: View {
    @FetchRequest(
        entity: StoreProduct.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \StoreProduct.name, ascending: true)]
    ) var products: FetchedResults<StoreProduct>

    var body: some View {
        List(products) { product in
            VStack(alignment: .leading) {
                Text(product.name ?? "No Name")
                    .font(.headline)
                Text(product.desc ?? "No Description")
                    .font(.subheadline)
            }
        }
        .navigationTitle("All Products")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
    }
}
