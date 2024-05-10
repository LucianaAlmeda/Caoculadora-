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
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Spacer()
            Text("Qual a idade do seu cão?")
            
            Text("Anos")
            TextField ("Quantos anos completos tem seu cão", value: $years, format: .number)

            
            Text("Meses")
            TextField ("E quantos meses ele tem", value: $months, format: .number)

            
            Text("Porte")
            
            Picker ("Portes", selection: $porteSelecionado) {
                ForEach (portes, id:\.self) {
                    porte in Text(porte)
                }
            }
            .pickerStyle(.segmented)
    
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth:.infinity)
                    .shadow(radius: 20)
            }
            Spacer()
            Button("Cãocular", action: processYears)
            
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
        
        //o resultado vai ser os anos * multiplicador + a fração do ano em meses * multiplicador
        //multiplicador:
        //* pequeno:6
        //* medio:7
        //* grande:8
        
        let multiplicador: Int
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador=8
        default:
            multiplicador=0
        }
        
        //o resultado vai ser anos * 7
       // result = years * 7
        //o resultado vau ser os anos * 7 + a fração do ano em meses * 7
//        result = years * 7 + months * 7/12
        result = years * multiplicador + months * multiplicador/12
        
    }

}

#Preview {
    ContentView()
}
