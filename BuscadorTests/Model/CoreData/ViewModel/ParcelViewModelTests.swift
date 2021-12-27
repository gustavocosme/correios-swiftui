//
//  ParcelViewModelTests.swift
//  BuscadorTests
//
//  Created by Gustavo Cosme on 25/12/21.
//

import XCTest
@testable import Buscador

class ParcelViewModelTests: XCTestCase {
    
    override func setUp() {
        _ = ParcelViewModel.deleteAll()
    }
    
    func test_create() {
        let create = ParcelViewModel.save(title: "Teste", code: "12312312321")
        let list = ParcelViewModel.getList()

        XCTAssertEqual(create, true)
        XCTAssertEqual(list.isEmpty, false)
    }
    
    func test_delete() {
        _ = ParcelViewModel.save(title: "Teste", code: "12312312321")
        let list = ParcelViewModel.getList()
        _ = ParcelViewModel.delete(list[0])
        
        XCTAssertEqual(ParcelViewModel.getList().count, 0)
    }
}
