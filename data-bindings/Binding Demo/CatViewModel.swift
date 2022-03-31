//
//  CatViewModel.swift
//  Binding Demo
//
//  Created by Andrew on 2022-02-04.
//

import Foundation
import Combine

class CatViewModel: ObservableObject {
    var didChangeData: ((CatViewModel) -> Void)?
    
    var name: String {
        didSet {
            didChangeData?(self)
        }
    }
    
    var age: Observable<Int> = Observable(value: 0)
    @Published var color: String
    
    init(cat: Cat) {
        self.name = cat.name
        self.age.value = 0
        self.color = "Brown"
    }
    
    func showData() {
        self.name = "Simba"
        self.age.value = 5
        color = "Red"
    }
}
