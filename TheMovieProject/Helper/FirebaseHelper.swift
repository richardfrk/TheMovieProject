//
//  FirebaseHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 22/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHelper {
    
    static var shared: FirebaseHelper {
        return FirebaseHelper()
    }
    
    private init() {
    
    }
    
    func reference() -> FIRDatabaseReference {
        
        return FIRDatabase.database().reference()
        
    }
}
