//
//  ContentView.swift
//  Lab07
//
//  Created by Jesse Mitra on 10/10/24.
//

import SwiftUI

struct ArticleView: View {
    @EnvironmentObject var articleViewModel: ArticleViewModel

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(articleViewModel.model.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: geometry.size.height / 3)
                        .clipped()

                    Text(articleViewModel.model.category)
                        .textCase(.uppercase)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding([.leading, .trailing], 16)

                    HStack {
                        Text(articleViewModel.model.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Image(systemName: articleViewModel.model.isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.1)
                            .onTapGesture {
                                articleViewModel.markAsFavorite()
                            }
                            .foregroundColor(articleViewModel.model.isFavorite ? .red : .black)
                    }
                    .padding([.leading, .trailing], 16)

                    Text(articleViewModel.model.text)
                        .padding([.leading, .trailing], 16)
                        .lineLimit(nil)
                    
                    if let url = URL(string: articleViewModel.model.url) {
                        Link("More...", destination: url)
                            .font(.body)
                            .foregroundColor(.blue)
                            .padding([.leading, .trailing], 16)
                    }

                    Spacer()
                }
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
            .environmentObject(ArticleViewModel())
    }
}
