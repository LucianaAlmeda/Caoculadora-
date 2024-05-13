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
        
        //o resultado vai ser os anos * multiplicador + a fração do ano em meses * multiplicador
        //multiplicador:
        //* pequeno:6
        //* medio:7
        //* grande:8
        
        let multiplicador: Int
        switch porteSelected {
        case .pequeno :
            multiplicador = 6
        case .médio:
            multiplicador = 7
        case .grande:
            multiplicador=8
        }
        
        //o resultado vai ser anos * 7
        //result = years * 7
        //o resultado vau ser os anos * 7 + a fração do ano em meses * 7
        //result = years * 7 + months * 7/12
        // multiplicador depende e varia de acordo com o porte 
        
        
        result = years * multiplicador + months * multiplicador/12
        
    }

}

#Preview {
    ContentView()
}
