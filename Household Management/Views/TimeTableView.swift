//
//  TimeTableView.swift
//  Household Management
//
//  Created by Edward Petcher on 23/02/2025.
//

import SwiftUI

struct ScrollableListView: View {
    let items = Array(1...50)  // Sample data

    var body: some View {
        List(items, id: \.self) { item in
            Text("Item \(item)")
                .padding()
        }
    }
}

struct ScrollableListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableListView()
    }
}
