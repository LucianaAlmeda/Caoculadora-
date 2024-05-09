//
//  ContentView.swift
//  Caoculadora
//
//  Created by Luciana Oliveira Almeda on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months: Int?
    @State var result: Int?
    
    var body: some View {
        VStack (alignment: .leading){
            
            Text("Qual a idade do seu cão?")
            
            Text("Anos")
            TextField ("Quantos anos completos tem seu cão", value: $years, format: .number)
            
            Text("Meses")
            TextField ("E quantos meses ele tem", value: $months, format: .number)
            
            Text("Porte")
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result)anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth:.infinity)
            }
            
            Button("Cãocular") {
                print("Cãocular")
        
            }
            .foregroundStyle(.white)
            .bold()
            
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.indigo)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad) //para nao aparecer letras
        .padding()
    }
}

#Preview {
    ContentView()
}
