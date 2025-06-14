//
//  EditBar.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 10/06/25.
//

import SwiftUI

struct EditBar: View {
    
    @Binding var showModal: Bool
    
    var body: some View {
        //MARK: EDIT BAR
        HStack{
            Spacer()
            Button{
                showModal = true
            }label:{
                Image(systemName: "ellipsis")
                    .foregroundStyle(.sBlack)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 32)
//                .border(.yellow)
    }
}

#Preview {
    EditBar(showModal: .constant(true))
}
