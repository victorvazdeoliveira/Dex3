//
//  Pokemon+Ext.swift
//  Dex3
//
//  Created by Victor Vaz de Oliveira on 23/10/24.
//

import Foundation

extension Pokemon {
    var background: String {
        switch self.types!.first! {
        case "normal", "grass", "electric", "poison", "fairy":
            return "normalgrasselectricpoisonfairy"
        case "rock", "ground", "steel", "ghost", "dark", "psychic":
            return "rockgroundsteelfightingghostdarkpsychic"
        case "fire", "dragon":
            return "firedragon"
        case "flying", "bug":
            return "flyingbug"
        case "ice":
            return "ice"
        case "water":
            return "water"
        default:
            return "normal"
        }
    }
    
    var stats: [Stat] {
        [
            Stat(id: 1, label: "HP", value: self.hp),
            Stat(id: 2, label: "Attack", value: self.attack),
            Stat(id: 3, label: "Defense", value: self.defense),
            Stat(id: 4, label: "Special Attack", value: self.specialAttack),
            Stat(id: 5, label: "Special Defense", value: self.specialDefense),
            Stat(id: 6, label: "Speed", value: self.speed)
        ]
    }
    
    var highestStat: Stat {
        stats.max { $0.value < $1.value }!
    }
    
    func organizeTypes() {
        if self.types!.count == 2 && self.types!.first! == "normal" {
            self.types!.swapAt(0, 1)
        }
    }
}

struct Stat: Identifiable {
    let id: Int
    let label: String
    let value: Int16
}
