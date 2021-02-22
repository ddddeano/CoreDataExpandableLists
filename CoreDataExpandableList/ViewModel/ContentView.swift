//
//  ContentView.swift
//  CoreDataExpandableList
//
//  Created by Daniel Watson on 22/02/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Family.entity(), sortDescriptors: [])
    var fetch: FetchedResults<Family>
    
    var body: some View {
        List {
            ForEach(fetch, id: \.self) { family in
                Section(header: Text(family.name)) {
                    ForEach(family.childrenArray , id: \.self) { child in
                        Text(child.name)
                    }
                }
            }
            Button("Add Data") {
                AddData()
            }
        }
    }
    func AddData() {
        let fam1 = Family(context: self.moc)
        fam1.name = "Watson"
        let fam2 = Family(context: self.moc)
        fam2.name = "Jones"
        
        let child1 = Child(context: self.moc)
        child1.name = "David"
        let child2 = Child(context: self.moc)
        child2.name = "Emma"
        let child3 = Child(context: self.moc)
        child3.name = "Paul"
        let child4 = Child(context: self.moc)
        child4.name = "Ringo"
        
        fam1.addToChildren([child1, child2])
        fam2.addToChildren([child3, child4])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
