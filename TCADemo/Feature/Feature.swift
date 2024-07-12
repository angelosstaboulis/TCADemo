//
//  Feature.swift
//  TCADemo
//
//  Created by Angelos Staboulis on 11/7/24.
//

import Foundation
import ComposableArchitecture
import SwiftUI
@Reducer
struct Feature {
    @ObservableState
    struct State: Equatable {
        var fetchData:Model
    }
    enum Action {
        case fetchResults
        case resetResults
        case processAPIResponse(Model)
    }
    @Dependency(\.dismiss) var dismiss
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchResults:
                return .run { send in
                        let apiManager = APIManager()
                        let model = await apiManager.fetchOPAPPropo(endpoint: "20185")
                        await send(.processAPIResponse(model))
                }
            case .resetResults:
                state.fetchData = .init(drawId: 0, visualDraw: 0, visualStartDate: "", visualEndDate: "", description: "", notes: "", matchXEvents: [])
                return .none
            case .processAPIResponse(let data):
                state.fetchData = data
                return .none
            }
        }
    }
}
