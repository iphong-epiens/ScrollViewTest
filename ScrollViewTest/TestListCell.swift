//
//  TestListCell.swift
//  ViewBuilder
//
//  Created by Inpyo Hong on 2021/08/24.
//

import SwiftUI

struct TestListCell: View {
    var item: ToDoItem?
    
    init(_ item: ToDoItem) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            Image(systemName: item!.imageName)
            Spacer()
            Text("\(item!.task)")
        }
    }
}

struct TestListCell_Previews: PreviewProvider {
    static var previews: some View {
        TestListCell(ToDoItem(task: "task", imageName: "command"))
    }
}
