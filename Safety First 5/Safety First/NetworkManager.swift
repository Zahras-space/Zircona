//
//  NetworkManager.swift
//  Safety First
//
//  Created by Zahra, Nayab - zahrn29 on 10/3/24.
//

import SwiftUI
import Network

enum NetworkStatus: String {
    case connected
    case disconnected
}

final class Monitor : ObservableObject {
    let Monitor = NWPathMonitor()
    let workqueue = DispatchQueue(label: "Monitor")
    
    //defuault value//
    @Published var status: NetworkStatus = .connected
    
    init() {
        Monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return}
            
            DispatchQueue.main.async{
                if path.status == .satisfied{
                    print("Internet Available")
                    self.status = .connected
                }
                else{
                    print ("No connection ")
                    self.status = .disconnected
                }
            }
        }
        
        Monitor.start(queue: workqueue)
    }
}

