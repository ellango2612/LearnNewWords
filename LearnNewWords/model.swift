//
//  model.swift
//  LearnNewWords
//
//  Created by Ella Ngo on 2/2/23.
//
// store some logic of app

import Foundation
import SwiftUI

class Model: ObservableObject {
    @Published var words: [Word] = []
    @Published var backgroundColor: Color = .accentColor
    
    func addNewWord(word: Word) {
        words.append(word)
        print(words)
    }
}

struct Word: Hashable {
    var word: String
    var translation: String
}

