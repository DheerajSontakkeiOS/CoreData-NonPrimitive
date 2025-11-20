//
//  ContentView.swift
//  CoreData-NonPrimitive
//
//  Created by MOBILE HUTT on 17/11/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    //most important as profiles updates UI also gets udpated
    @FetchRequest(
           sortDescriptors: [NSSortDescriptor(keyPath: \Profile.id, ascending: false)],
           animation: .default
       )
    private var profiles: FetchedResults<Profile>
    
    @State private var sampleImage = UIImage(systemName: "person.fill")
    @State private var pickedColor = Color.blue
    
    let manager = ProfileManager.shared
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Create Sample Profile") {
                    createSample()
                }
                .padding()
                
                List {
                    ForEach(profiles) { profile in
                        HStack {
                            if let img = profile.uiImage {
                                Image(uiImage: img)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                            
                            VStack(alignment: .leading) {
                                Text("ID: \(profile.id?.uuidString.prefix(6) ?? "")")
                                Text("Tags: \((profile.tags as? Set<String>)?.joined(separator: ", ") ?? "None")")
                                    .font(.caption)
                                
                                Text("Color Preview")
                                    .padding(4)
                                    .background(Color(profile.uiColor))
                                    .cornerRadius(6)
                            }
                            
                            Spacer()
                            
                            Button("Update") {
                                manager.updateProfile(profile: profile, newColor: UIColor.randomColor)
                            }
                            .buttonStyle(.bordered)
                                                        
                            Button("Delete") {
                                manager.deleteProfile(profile)
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(.red)
                        }
                        .background(Color.cyan)
                    }
                }
            }
            .navigationTitle("Non-Primitive Core Data")
            .onAppear { }
        }
    }
    
    func createSample() {
        manager.createProfile(id: UUID(), photos: sampleImage ?? UIImage(), scores: [10, 20, 30], favouriteColor: UIColor.randomColor, tags: ["Swift", "iOS", "CoreData"], settings: ["theme": "dark", "volume": 0.8])
    }
}

extension UIColor {
    static var randomColor: UIColor {
        let r = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        let g = Double.random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
