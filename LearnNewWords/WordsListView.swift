//
//  WordsListView.swift
//  LearnNewWords
//
//  Created by Ella Ngo on 1/28/23.
//

import SwiftUI

struct WordsListView: View {
    
    @ObservedObject var model: Model
    
    
    @State var detailSheetIsPresented = false
    @State var settingsSheetIsPresented = false
    
    var body: some View {
        NavigationStack {
// 1st view
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                ZStack {
                    List {
                        ForEach(model.words, id: \.self) { word in
                            ZStack {
                                NavigationLink(destination: WordDetailView(translation: word.translation)) {
                                    Text(word.word)
                                        .fontWeight(.heavy)
                                }
                            }
                        }
                        .onDelete(perform: deleteItem)
                    }
                    .scrollContentBackground(.hidden)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
// goes to detailSheet - enter word an translation to submit
                                detailSheetIsPresented.toggle()
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                settingsSheetIsPresented.toggle()
                            } label: {
                                Image(systemName: "gear")
                            }
                        }
                    }
                    .sheet(isPresented: $detailSheetIsPresented) {
                        NewWordSheetView(model: model)
                    }
                    .sheet(isPresented: $settingsSheetIsPresented) {
                        SettingsSheetView(model: model)
                    }
                }
            }
        }
    }
    
    
    func deleteItem(at offset: IndexSet) {
        model.words.remove(atOffsets: offset)
    }
}


