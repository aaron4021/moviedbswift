//
//  HorizontalScrollView.swift
//  TheMovieDB
//
//  Created by Intern on 13/07/23.
//

import SwiftUI

struct RectangleView: View {
    @State var title: String
    @Binding var currentPage: Int
    var body: some View {
        Button {
            currentPage = Int(title) ?? 1
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50, alignment: .center)
                Text(title)
                    .foregroundColor(.black)
            }
        }

    }
}
struct HorizontalScrollView: View {
    @Binding var currentPage: Int
    var count: Int
    var body: some View {
        VStack {
            Divider()
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(1..<count+1) {
                        pageNumber in RectangleView(title: "\(pageNumber)", currentPage: $currentPage)
                    }
                }.padding()
            }.frame(height: 80)
        }
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        @State var currentPage: Int = 1
        HorizontalScrollView(currentPage: $currentPage, count: 20)
    }
}
