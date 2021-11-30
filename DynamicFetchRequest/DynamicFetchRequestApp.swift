//
//  DynamicFetchRequestApp.swift
//  DynamicFetchRequest
//
//  Created by Larry Burris on 11/30/21.
//

import SwiftUI

@main
struct DynamicFetchRequestApp: App
{
    @StateObject private var dataController = DataController()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
