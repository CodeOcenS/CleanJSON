//
//  ViewController.swift
//  CleanJSON
//
//  Created by Pircate on 2018/5/3.
//  Copyright © 2018年 Pircate. All rights reserved.
//

import UIKit

struct TestModel<T: Codable>: Codable {
    let boolean: Int
    let integer: Float
    let double: String
    let string: Double
    let array: [String]
    let nested: Nested
    let notPresent: T
    let optional: String?
    
    struct Nested: Codable {
        let a: String
        let b: Bool
        let c: Int
    }
    
    struct NotPresent: Codable {
        let a: String
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // @see CleanJSONTests
        
        let json = """
             {
                 "boolean": true,
                 "integer": 1,
                 "double": -3.14159265358979323846,
                 "string": "string",
                 "array": [1, 2.1, "3", true],
                 "nested": {
                     "a": "alpha",
                     "b": "bravo",
                     "c": "charlie"
                 }
             }
        """.data(using: .utf8)!
        
        do {
            let model = try CleanJSONDecoder().decode(TestModel<Bool>.self, from: json)
            debugPrint(model.boolean)
            debugPrint(model.integer)
            debugPrint(model.double)
            debugPrint(model.string)
            debugPrint(model.array)
            debugPrint(model.nested.a)
            debugPrint(model.nested.b)
            debugPrint(model.nested.c)
            debugPrint(model.notPresent)
            debugPrint(model.optional)
        } catch {
            debugPrint(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

