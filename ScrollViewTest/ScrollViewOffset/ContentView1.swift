//
//  ContentView.swift
//  ScrollViewTest
//
//  Created by Inpyo Hong on 2021/08/25.
//

import SwiftUI

//ScrollViewOffset https://www.fivestars.blog/articles/scrollview-offset/
//example 1

struct ContentView1: View {
  @State private var scrollOffset: CGFloat = .zero

  var body: some View {
    ZStack {
      scrollView
      statusBarView
    }
  }

  var scrollView: some View {
    ScrollViewOffset {
      scrollOffset = $0
    } content: {
      LazyVStack {
        ForEach(0..<100) { index in
          Text("\(index)")
        }
      }
    }
  }

  var statusBarView: some View {
    GeometryReader { geometry in
      Color.red
        .opacity(opacity)
        .frame(height: geometry.safeAreaInsets.top, alignment: .top)
        .edgesIgnoringSafeArea(.top)
    }
  }

  var opacity: Double {
    switch scrollOffset {
    case -100...0:
      return Double(-scrollOffset) / 100.0
    case ...(-100):
      return 1
    default:
      return 0
    }
  }
}

//example 2

//struct ContentView: View {
//  @State var scrollOffset: CGFloat = .zero
//
//  var body: some View {
//    ZStack {
//      backgroundColor
//      scrollView
//    }
//  }
//
//  var backgroundColor: some View {
//    Color(
//      //         This number determines how fast the color changes 👇🏻
//      hue: Double(abs(scrollOffset.truncatingRemainder(dividingBy: 3500))) / 3500,
//      saturation: 1,
//      brightness: 1
//    )
//    .ignoresSafeArea()
//  }
//
//  var scrollView: some View {
//    ScrollViewOffset {
//      scrollOffset = $0
//    } content: {
//      LazyVStack(spacing: 8) {
//        ForEach(0..<100) { index in
//          Text("\(index)")
//            .font(.title)
//        }
//      }
//    }
//  }
//}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
