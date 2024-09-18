//
//  PortraitViews.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/18/24.
//

import SwiftUI

struct PortraitViews: View {
    let imageURL: URL?
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .padding()
                })
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.clear)
                    .frame(width: 100, height: 150)
                    .background {
                        AsyncImage(url: imageURL, content: { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 150)
                        }, placeholder: {
                            Image(systemName: "person.and.background.dotted")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 150)
                                
                        })
                        .scaledToFill()
                    }

            }
        }
    }
}

#Preview {
    PortraitViews(imageURL: nil)
}
