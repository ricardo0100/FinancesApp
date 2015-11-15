//
//  TransactionModel.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 15/11/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

enum TipoTransacao {
    
    case Receita, Debito
    
}

class TransactionModel {
    
    var id: Int = 0
    var tipo: TipoTransacao = TipoTransacao.Debito
    var valor: Float = 0
    var category: CategoryModel?
    
}