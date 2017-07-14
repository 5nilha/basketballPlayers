//
//  players.swift
//  Sport Players
//
//  Created by Fabio Quintanilha on 7/12/17.
//  Copyright © 2017 Studio. All rights reserved.
//

import Foundation

    private var last_ID = 1

class Player {
    
    private let id: String
    let uuid = NSUUID().uuidString
    private var name: String!
    private var age: String!
    private var country: String!
    private var weight: String!
    private var height: String!
    private var playerData: [String]!

    
    init (name: String, age: String, country: String, weight: String, height: String) {
        self.id = uuid
        self.name = name
        self.age = age
        self.country = country
        self.weight = weight
        self.height = height
    }
    
  
    func getID() -> String {
        return (self.id)
    }
    
    func getName() -> String {
        
        return self.name
    }
    func setName(name: String) {
        self.name = name
    }
    
    func getAge() -> String {
        return self.age
    }
    
    func setAge(age: String) {
        self.age = age
    }
    
    func getCountry() -> String {
        return self.country
    }
    
    func setCountry(country: String) {
        self.country = country
    }
    
    func getWeight() -> String {
        return self.weight
    }
    
    func getHeight() -> String {
        return self.height
    }
    
    func getPlayer(playerData: [String]){
        self.playerData = playerData
    }
    
    func playerToEdit() -> [String]{
        return self.playerData
    }
}

var players = [[String]]()  // this array stores the array of data of each player
var singlePlayer = [String]() // This array stroes the data of each player


