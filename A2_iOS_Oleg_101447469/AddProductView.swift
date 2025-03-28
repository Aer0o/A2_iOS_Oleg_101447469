//
//  AddProductView.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var desc = ""
    @State private var price = ""
    @State private var provider = ""

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $desc)
            TextField("Price", text: $price)
                .keyboardType(.decimalPad)
            TextField("Provider", text: $provider)

            Button("Save") 
                let newProduct = Product(context: viewContext)
                newProduct.id = UUID()
                newProduct.name = name
                newProduct.desc = desc
                newProduct.price = Double(price) ?? 0
                newProduct.provider = provider

                try? viewContext.save()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add New Product")
    }
}
