//
//  Model.swift
//  TCADemo
//
//  Created by Angelos Staboulis on 11/7/24.
//

import Foundation
struct Results: Codable,Hashable,Equatable {
    let programPosition:Int
    let matchTime:String?
    let teamHome:String
    let teamAway:String
    let score:String
    let evaluationHome:Int
    let evaluationAway:Int
    let evaluationDraw:Int
    let total:Int
    let result:Int
    let status:String?
    func hash(into hasher: inout Hasher) {
        hasher.combine(programPosition)
    }
}

// MARK: - Model
struct Model: Codable {
    let drawId:Int
    let visualDraw:Int
    let visualStartDate:String?
    let visualEndDate:String?
    let description:String?
    let notes:String?
    let matchXEvents: [Results]
 
}
extension Model: Equatable {}

func ==(lhs:Model, rhs: Model) -> Bool {
   let areEqual = lhs.visualStartDate != rhs.visualEndDate
   return true
}
