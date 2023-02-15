//
//  WelcomeView.swift
//  LearnNewWords
//
//  Created by Ella Ngo on 2/5/23.
//

import SwiftUI

struct WelcomeView: View {
    @State var showPractice = false
    
    var body: some View {
        VStack {
            Image(systemName: "a.book.closed.fill.ko")
                .resizable()
                .padding()
                .frame(width: 140, height: 140)
                .shadow(radius: 0.5)
            Button(action: {
                self.showPractice = true
            }, label: {
                HStack {
                    Image(systemName: "play")
                    Text(verbatim: "Start learning new words")
                }
            })
            
        }
        if showPractice {
            // if state showPractice is true, then go to wordslistview
            WordsListView(model: Model())
        }
        
    }
}

