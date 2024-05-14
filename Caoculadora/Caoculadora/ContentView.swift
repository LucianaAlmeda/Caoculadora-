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
    
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    @State var porteSelected = Porte.pequeno
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Spacer()
            Text("Qual a idade do seu cão?").font(.header5)
            
            Text("Anos").font(.body1)
            TextField ("Quantos anos completos tem seu cão", value: $years, format: .number)
            
            
            Text("Meses").font(.body1)
            TextField ("E quantos meses ele tem", value: $months, format: .number)
            
            
            Text("Porte").font(.body1)
            
            Picker ("Portes", selection: $porteSelected) {
                ForEach (Porte.allCases, id:\.self) {
                    porte in Text(porte.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...").font(.body1)
                Text("\(result) anos").font(.display)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth:.infinity)
                    .shadow(radius: 20)
            }
            Spacer()
            Button("Cãocular", action: processYears).font(.body1)
            
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
    
    func processYears () {
        print ("Cãocular")
        
        guard let years, let months else {
            print("Campos não preechidos")
            return }
        
        guard months > 0 || years > 0 else {
            print("pelo menos um campo deve ser maior que zero")
            return }
        
        result = porteSelected.calcularIdade(deAnos: years, eMeses: months)
        
        #Preview {
            ContentView()
        }
    }
}
