//
//  TabBarView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct TabBar: View {
    
    var viewModel: ViewController = ViewController()
    
    @Binding var selectedView: Views
    
    let homeIconName: String = "home"
    let trackIconName: String = "track"
    let graphIconName: String = "graph"
    
    let enabledState: String = "-enabled"
    let disabledState: String = "-disabled"
    
    var body: some View {
        
        //MARK: TAB BAR
        Divider()
            .padding(.bottom, 8)
            .padding(.horizontal, 32)
        
        HStack{
            Button{
                withAnimation{
                    selectedView = .home
                }
            }label:{
                Image(homeIconName + (selectedView == .home ? enabledState : disabledState))
                    .frame(width: 60, height: 40)
                    .font(.system(size: 28))
                    .fontWeight(.thin)
            }
            
            Button{
                withAnimation{
                    selectedView = .track
                }
            }label:{
                Image(trackIconName + (selectedView == .track ? enabledState : disabledState))
                    .frame(width: 60, height: 40)
                    .font(.system(size: 28))
                    .fontWeight(.thin)
            }
            
            Button{
                withAnimation{
                    selectedView = .graph
                }
            }label:{
                Image(graphIconName + (selectedView == .graph ? enabledState : disabledState))
                    .frame(width: 60, height: 40)
                    .font(.system(size: 28))
                    .fontWeight(.thin)
            }
        }
    }
}

#Preview {
    TabBar(selectedView: .constant(.home))
}
