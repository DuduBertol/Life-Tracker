//
//  QuotesSheer.swift
//  Life-Tracker
//
//  Created by Eduardo Bertol on 11/06/25.
//

import SwiftUI

struct QuotesSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var quotesViewModel: QuotesViewModel
    
    @State var createQuoteStackEnabled: Bool = false
    
    @State var phraseText: String = ""
    @State var authorText: String = ""
    
    var body: some View {
        
        ScrollView{
            //MARK: MODAL
            
            VStack(alignment: .leading, spacing: 24){
                
                //MARK: QUOTES TITLE
                HStack{
                    Text("quotes")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundStyle(.sBlack)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("new quote:")
                        Spacer()
                        Button{
                            withAnimation{
                                createQuoteStackEnabled.toggle()
                            }
                        }label:{
                            Image(systemName: "plus")
                        }
                    }
                    .font(.system(size: 20, weight: .light))
                    .foregroundStyle(.sBlack)
                    
                    //MARK: CREATE QUOTE
                    if createQuoteStackEnabled{
                        VStack(alignment: .leading){
                            Text("phrase:")
                                .font(.system(size: 16, weight: .thin))
                                .foregroundStyle(.sBlack)
                            TextField("type the phrase here...", text: $phraseText)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(.sGray3)
                                .cornerRadius(16)
                        }
                        .padding(.leading, 16)
                        
                        VStack(alignment: .leading){
                            Text("author:")
                                .font(.system(size: 16, weight: .thin))
                                .foregroundStyle(.sBlack)
                            TextField("type the author here...", text: $authorText)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(.sGray3)
                                .cornerRadius(16)
                        }
                        .padding(.leading, 16)
                        
                        HStack{
                            Spacer()
                            Button{
                                //get phrase
                                //get author
                                //create newQuote Quote(phrase, author)
                                //quotes list append newQuote
                                quotesViewModel.addQuote(phrase: $phraseText.wrappedValue, author: $authorText.wrappedValue)
                                phraseText = ""
                                authorText = ""
                            }label:{
                                Text("add")
                                    .font(.system(size: 16, weight: .thin))
                                    .foregroundStyle(.sBlack)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                    
                    //MARK: QUOTES LIST
                    VStack(alignment: .leading, spacing: 16){
                        
                        HStack{
                            Text("my quotes:")
                                .font(.system(size: 20, weight: .light))
                            Spacer()
                            Text("\($quotesViewModel.quotes.count)")
                                .font(.system(size: 12, weight: .thin))
                        }
                        
                        ForEach($quotesViewModel.quotes) { $quote in
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text($quote.wrappedValue.phrase)
                                        .font(.system(size: 16, weight: .light))
                                        .foregroundStyle(.sBlack2)
                                    HStack{
                                        Spacer()
                                        Text($quote.wrappedValue.author)
                                            .font(.system(size: 10, weight: .thin))
                                            .foregroundStyle(.sBlack2)
                                    }
                                }
                                
                                if createQuoteStackEnabled{
                                    Button{
                                        withAnimation{
                                            quotesViewModel.removeQuote(quote: $quote.wrappedValue)
                                        }
                                    }label:{
                                        Image(systemName: "minus")
                                            .padding(.leading, 16)
                                            .font(.system(size: 20, weight: .light))
                                            .foregroundStyle(.sBlack)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 24)
                    
                }
                
                
                Spacer()
            }
            .padding(32)
            .navigationBarBackButtonHidden()
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
}

#Preview {
    QuotesSheet()
        .environmentObject(QuotesViewModel())
}
