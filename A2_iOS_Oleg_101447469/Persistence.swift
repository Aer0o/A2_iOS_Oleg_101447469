//
//  Persistence.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "A2_iOS_Oleg_101447469")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        preloadSampleProducts()
    }

    private func preloadSampleProducts() {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        fetchRequest.fetchLimit = 1

        let count = (try? context.count(for: fetchRequest)) ?? 0
        if count == 0 {
            for i in 1...10 {
                let product = Product(context: context)
                product.id = UUID()
                product.name = "Product \(i)"
                product.desc = "Description for product \(i)"
                product.price = Double(i * 10)
                product.provider = "Provider \(i)"
            }
            try? context.save()
        }
    }
}

