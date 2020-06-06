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
    var card : CardModel.Card?
    
    var function : ((CardModel.Card)->Void)?
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    @State private var txtTitle : String = ""
    @State private var txtContent : String = ""
    @State private var pkrStatus : Int = 0
    @State private var showPopover = false
    
    let status = ["To Do","Doing","Done"]
    var body: some View {
        
         NavigationView {
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
            
            .navigationBarItems(
                
                leading:  Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    }){Text("Cancel")},
                
                trailing: Button(action: {
                    if !(self.txtTitle == ""){
                        self.addOrEdit()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    else {
                        self.showPopover = true
                    }
                }){Text("Save")}
                    .alert(isPresented: $showPopover){
                        Alert(title: Text("Type some title"))
                }
        
            )
        }
   
    }
    
    init(_ task: String, action: @escaping (CardModel.Card) -> Void)
     {
         self.task = task
         self.function = action
     }
     
     init(_ task: String, card: CardModel.Card, action: @escaping (CardModel.Card) -> Void){
         self.task = task
         self.card = card
         self._txtTitle = State(wrappedValue: card.title)
         self._txtContent = State(wrappedValue: card.desc)
         self._pkrStatus = State(wrappedValue: card.status.rawValue)
         self.function = action
     }

    func addOrEdit()
    {
        if var ca : CardModel.Card = self.card {
            ca.title = txtTitle
            ca.desc = txtContent
            ca.status = EnumStatus(rawValue: pkrStatus)!
            function!(ca)
        } else {
            
            function!(CardModel.Card(title: txtTitle, desc: txtContent, status: EnumStatus(rawValue: pkrStatus)!))

        }
    }
    
}
