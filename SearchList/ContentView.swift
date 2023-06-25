//
//  ContentView.swift
//  SearchList
//
//  Created by Manoj Kumar on 23/06/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var listdata:userDataClass
    @EnvironmentObject var filteredData:userDataClass

    @State private var searchString = ""
    var body: some View {
        VStack {
            TextField("search Text", text: $searchString)
                .onChange(of: searchString) { newValue in
                    filteredData.aryUserData = listdata.aryUserData.filter({ data in
                        if newValue.isEmpty{
                            return true
                        }
                       
                        return data.name.lowercased().contains(newValue.lowercased())
                    })
                }
            List{
                ForEach(0..<filteredData.aryUserData.count,id: \.self) { row in
                    Button {
                        filteredData.aryUserData[row].isSelected = !filteredData.aryUserData[row].isSelected
                        changeInOriginalData(id: filteredData.aryUserData[row].id, isSelected: filteredData.aryUserData[row].isSelected)
                    } label: {
                        Text(filteredData.aryUserData[row].name)
                            .foregroundColor(filteredData.aryUserData[row].isSelected ? Color.red : Color.blue)
                    }
         
                }
            }
            
        }
        .padding()
    }
    
    func changeInOriginalData(id:UUID,isSelected:Bool){
        if let row = listdata.aryUserData.firstIndex(where: {$0.id == id}){
            listdata.aryUserData[row].isSelected = isSelected
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct userData{
    let id = UUID()
    var name:String
    var isSelected:Bool = false
}

class userDataClass: ObservableObject{
    @Published var aryUserData =  [
        userData(name: "manoj"),
        userData(name: "anil"),
        userData(name: "aditya"),
        userData(name: "neeraj"),
        userData(name: "deepak")
    ]
    init() {
        
    }
}


