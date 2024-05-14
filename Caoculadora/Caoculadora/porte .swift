//
//  porte .swift
//  Caoculadora
//
//  Created by Luciana Oliveira Almeda on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case médio = "Médio"
    case grande = "Grande"
    
    func calcularIdade(deAnos anosCaninos: Int, eMeses mesesCaninos: Int) -> Int {
        
        //o resultado vai ser os anos * multiplicador + a fração do ano em meses * multiplicador
        //multiplicador:
        //* pequeno:6
        //* medio:7
        //* grande:8
        
        let multiplicador: Int
        switch self {
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
        
        
        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador/12
        return result
    }
}

