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
                Button("Scroll to bottom") {
                    withAnimation {
                        scrollView.scrollTo(0, anchor: .center)
                    }
                }
                
                LazyVStack {
                    ForEach(0..<100) { index in
                        VStack{
                            Text("\(index): Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                                Divider()
                        }
                        .flippedUpsideDown()
                        .id(index)
                    }.padding()
                }.flippedUpsideDown()
                
                Button("Scroll to top") {
                    withAnimation {
                        scrollView.scrollTo(99, anchor: .center)
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
