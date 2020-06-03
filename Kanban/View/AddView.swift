//
//  AddView.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 03/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct AddView: View {
    var task : String
    
    var function : (CardModel.Card)->Void
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    @State private var txtTitle : String = ""
    @State private var txtContent : String = ""
    @State private var pkrStatus : Int = 0
    
    let status = ["To Do","Doing","Done"]
    var body: some View {
        
        return NavigationView {
            Form{
                TextField("Title", text: $txtTitle)
                TextField("Content", text: $txtContent).frame(height: 150).lineLimit(10)
                
                Picker("Status", selection: $pkrStatus) {
                    ForEach(0..<status.count) {
                        Text(self.status[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                }
            
                .navigationBarTitle("\(task)", displayMode: .inline)
                .navigationBarItems(leading:  Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    }){Text("Cancel")} ,
                trailing: Button(action: {
                    
                }){Text("Save")} )
        }
   
    }
    
    init(_ task: String, action: @escaping (CardModel.Card) -> Void)
    {
        self.task = task
        self.function = action
    }
    
    init(_ task: String, card: CardModel.Card, action: @escaping (CardModel.Card) -> Void){
        self.task = task
        self._txtTitle = State(wrappedValue: card.title)
        self._txtContent = State(wrappedValue: card.desc)
        self._pkrStatus = State(wrappedValue: card.status.rawValue)
        self.function = action
    }

}