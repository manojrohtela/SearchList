//
//  ContentListinView.swift
//  SearchList
//
//  Created by Manoj Kumar on 25/06/23.
//

import SwiftUI

struct ContentListinView: View {
    @ObservedObject var listdata:userDataClass = userDataClass()
    var body: some View {
        VStack{
            List{
                ForEach(0..<listdata.aryUserData.count,id: \.self){ row in
                    Text(listdata.aryUserData[row].name)
                }
            }
            ContentView().environmentObject(listdata)
        }
    }
}

//struct ContentListinView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentListinView()
//    }
//}
