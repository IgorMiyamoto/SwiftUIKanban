//
//  ShowDataCardView.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct ShowDataCardView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var card: CardModel.Card
    @State private var showingCard = false
    var body: some View {
        
        NavigationView {
            
                Form {
                    Section {
                        Text(card.status.stringValue()).font(.body).bold()
                        Text(card.desc).font(.body)
                        
                    }.padding()
                    
                }
                           
            .navigationBarTitle(Text(card.title).bold())
            .navigationBarItems(leading:  Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){Text("Dismiss")})
            
        }.accentColor(.green)
    }
}
