//
//  ProfileSheet.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 10/06/25.
//

import SwiftUI

struct ProfileSheet: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    @State var nameText: String = ""
    
    var body: some View {
        
        //MARK: MODAL
        
        VStack(alignment: .leading, spacing: 24){
            
            //MARK: PROFILE TITLE
            HStack{
                Text("profile")
                    .font(.system(size: 28, weight: .regular))
                    .foregroundStyle(.sBlack)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 16){
                Text("about me, \($profileViewModel.name.wrappedValue)")
                    .font(.system(size: 20, weight: .light))
                    .foregroundStyle(.sBlack)
                
                VStack(alignment: .leading){
                    Text("name:")
                        .font(.system(size: 16, weight: .thin))
                        .foregroundStyle(.sBlack)
                    TextField("\($profileViewModel.name.wrappedValue)", text: $nameText)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(.sGray3)
                        .cornerRadius(16)
                    
                }
                .padding(.leading, 16)
                
                HStack{
                    Spacer()
                    Button{
                        withAnimation{
                            profileViewModel.editName(name: $nameText.wrappedValue)
                        }
                    }label:{
                        Text("ok")
                            .font(.system(size: 16, weight: .thin))
                            .foregroundStyle(.sBlack)
                            .padding(.trailing, 16)
                    }
                }
                
            }
            
            
            Spacer()
        }
        .padding(32)
        .navigationBarBackButtonHidden() //tirar isso perde o componente de voltar com slide
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                Button{
                    dismiss()
                }label:{
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .regular))
                }
                .foregroundStyle(.sBlack)
            }
        }
    }
}

#Preview {
    ProfileSheet()
        .environmentObject(ProfileViewModel())
}
