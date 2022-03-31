//
//  Observable.swift
//  Binding Demo
//
//  Created by Andrew on 2022-02-04.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet { listener?(value) }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        listener = closure
        listener?(value)
    }
}
