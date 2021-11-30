//
//  FilteredList.swift
//  DynamicFetchRequest
//
//  Created by Larry Burris on 11/30/21.
//
import CoreData
import SwiftUI

// Type must be an NSManagedObject and Content must conform to View protocol
struct FilteredList<T: NSManagedObject, Content: View>: View
{
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    //  Receive a generic type and return the content which will be a list containing the specified object type
    let content: (T) -> Content
    
    var body: some View
    {
        List(fetchRequest, id: \.self)
        {
            item in
            
            self.content(item)
        }
    }
    
    //  @ViewBuilder allows the content to be multiple views rolled into one return type like VStack, HStack, etc.
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content)
    {
        //  The underscore represents the fetchRequest variable in the @FetchRequest struct and NOT the entire @FetchRequest object type.
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        
        self.content = content
    }
}
