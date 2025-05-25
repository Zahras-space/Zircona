//
//  Router.swift
//  Safety First
//
//  Created by Zahra, Nayab - zahrn29 on 10/3/24.
//

import SwiftUI

class Router: ObservableObject{
    static let shared = Router()
    @Published var selectedTab = 0
}

