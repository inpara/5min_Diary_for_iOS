//
    // Created on 2022/09/30.
    // 
    

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext//環境変数managedObjectContextを取得し、viewContextに格納
    
    
    
    var body: some View {
        Text("Hello CoreData!!")
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
