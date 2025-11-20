//
//  ProfileManager.swift
//  CoreData-NonPrimitive
//
//  Created by MOBILE HUTT on 20/11/25.
//

import Foundation
import UIKit

class ProfileManager {
    
    static let shared = ProfileManager()
    
    let context = CoreDataHandler.shared.context
    
    
    func createProfile(id: UUID, photos: UIImage, scores: [Int], favouriteColor: UIColor, tags: Set<String>, settings: [String: Any]) {
        
        let viewContext = CoreDataHandler.shared.context
        
        let profile = Profile(context: viewContext)
        profile.id = id
        profile.uiImage = photos
        profile.scores = scores as NSObject
        profile.uiColor = favouriteColor
        profile.tags = tags as NSObject
        profile.settings = settings as NSObject
        
        CoreDataHandler.shared.saveContext()
        
        
    }
    
    func fetchProfiles() -> [Profile]? {
        let fetchRequest = Profile.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        return try? context.fetch(fetchRequest)
    }
    
    func updateProfile(profile: Profile, newColor: UIColor) {
        profile.uiColor = newColor
        CoreDataHandler.shared.saveContext()
    }
    
    func deleteProfile(_ profile: Profile) {
        context.delete(profile)
        CoreDataHandler.shared.saveContext()
    }
    
}
