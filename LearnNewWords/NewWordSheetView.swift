//
//  NewWordSheetView.swift
//  don't-know-yet
//
//  Created by Ella Ngo on 2/2/23.
//

import SwiftUI

struct NewWordSheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var model: Model
    
    @State var newWordWord = ""
    @State var newWordTranslation = ""
    
    var body: some View {
        VStack {
            TextField(" Enter word", text: $newWordWord)
                .padding(0.75)
                .font(.headline)
            TextField(" Enter translation", text: $newWordTranslation)
                .padding(0.75)
                .font(.headline)
                .onSubmit {
                    guard !newWordWord.isEmpty && !newWordTranslation.isEmpty else { return }
                    model.addNewWord(word: Word(word: newWordWord, translation: newWordTranslation))
                    dismiss()
                }
            Button {
                model.addNewWord(word: Word(word: newWordWord, translation: newWordTranslation))
                dismiss()
            } label: {
                Text("Press to submit")
                    .bold()
            }
        }
    }
}
