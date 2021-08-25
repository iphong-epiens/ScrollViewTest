//
//  ContentView.swift
//  ScrollViewTest
//
//  Created by Inpyo Hong on 2021/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var listData: [ToDoItem] = []

    var body: some View {
        
        ScrollViewReader { scrollView in
            
            ScrollView(
                axes: [.vertical],
                showsIndicators: false,
                offsetChanged: {
                    print("offsetChanged", $0)
                }
            ) {
                Button(action: {
                    print("tap button")
                    self.listData.append(ToDoItem(task: "task\(listData.count+1)\nDonec id elit non mi porta gravida at eget metus.", imageName: "command"))
                    
                }, label: {
                    Text("add msg")
                })
                
                Button("Scroll to bottom") {
                    withAnimation {
                        scrollView.scrollTo(0, anchor: .top)
                    }
                }
                
                LazyVStack {
                    ForEach(0..<listData.count, id: \.self) { i in
                        TestListCell(listData[i])
                            .id(i)
                            .flippedUpsideDown()
                        
                    }.padding()
                }.flippedUpsideDown()
                .onChange(of: listData, perform: { value in
                    print("listData.count",listData.count)
                })
                .onAppear{
                    for index in 1...100 {
                        listData.append(ToDoItem(task: "task\(index)", imageName: "command"))
                    }
                }
                
                Button("Scroll to top") {
                    withAnimation {
                        scrollView.scrollTo(listData.count-1, anchor: .bottom)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
