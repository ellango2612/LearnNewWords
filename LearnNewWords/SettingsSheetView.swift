//
//  SettingsSheetView.swift
//  don't-know-yet
//
//  Created by Ella Ngo on 2/2/23.
//

import SwiftUI

struct SettingsSheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var model: Model
    
    @State var newWordWord = ""
    @State var newWordTranslation = ""
    
    var body: some View {
        ColorPicker("change background color", selection: $model.backgroundColor)
    }
}
