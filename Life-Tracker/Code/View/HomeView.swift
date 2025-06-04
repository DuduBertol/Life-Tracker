//
//  HomeView.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 03/06/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        //MARK: HOME
        VStack{
            
            
            //MARK: CONTENT
            VStack{
                
                
                //MARK: EDIT BAR
                HStack{
                    Spacer()
                    Button{
                        
                    }label:{
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.sBlack)
                    }
                }
                .padding(.vertical, 16)
//                .border(.yellow)
                
                //MARK: TITLE
                let titlePhrase: String = "good morning, dudu"
                Text(titlePhrase)
                    .font(.system(size: 28, weight: .thin))
                
                Spacer()
                
                //MARK: TEMPERATURE
                HStack{
                    Spacer()
                    
                    let temperature: Int = 10
                    Text("\(temperature)º")
                        .font(.system(size: 64, weight: .regular))
                        .padding(.trailing, 32)
                    
                    Text("\(temperature)º")
                        .font(.system(size: 64, weight: .regular))
                }
                
                Spacer()
                
                //MARK: QUOTE
                VStack{
                    
                    let phrase: String = "\"this is a quote, this is a quote, this is a quote.\""
                    let author = "Name of the Author"
                    
                    Text(phrase)
                        .font(.system(size: 20, weight: .light))
                    HStack{
                        Spacer()
                        Text(author)
                            .font(.system(size: 12, weight: .thin))
                    }
                }
                
                Spacer()
                
                //MARK: EVENTS
                VStack(alignment: .leading, spacing: 24){
                    //EVENTS - TITLE
                    HStack{
                        Text("your events")
                            .font(.system(size: 28, weight: .thin))
                        Spacer()
                        Button{
                            
                        }label:{
                            Image(systemName: "plus")
                                .foregroundStyle(.sBlack)
                                .font(.system(size: 28, weight: .thin))
                        }
                    }
                    //EVENTS - LIST
                    VStack(spacing: 16){
                        //SINGLE EVENT
                        VStack(alignment: .leading){
                            Text("03")
                                .font(.system(size: 28, weight: .regular))
                            Text("Event event")
                                .font(.system(size: 16, weight: .light))
                        }
                        //SINGLE EVENT
                        VStack(alignment: .leading){
                            Text("03")
                                .font(.system(size: 28, weight: .regular))
                            Text("Event event")
                                .font(.system(size: 16, weight: .light))
                        }
                        //SINGLE EVENT
                        VStack(alignment: .leading){
                            Text("03")
                                .font(.system(size: 28, weight: .regular))
                            Text("Event event")
                                .font(.system(size: 16, weight: .light))
                        }
                    }
                }
            }
//            .border(.red)
            .padding([.leading, .trailing, .bottom], 32)
            
            
            
        }
    }
}

#Preview {
    HomeView()
    TabBar(selectedView: .constant(.home))
}
