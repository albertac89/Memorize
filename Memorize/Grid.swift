//
//  Grid.swift
//  Memorize
//
//  Created by Aige Cortasa, Albert on 17/09/2020.
//  Copyright © 2020 Aige Cortasa, Albert. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View  {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.gridBody(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func gridBody(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.itemBody(for: item, in: layout)
        }
    }
    
    private func itemBody(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
    }
}
