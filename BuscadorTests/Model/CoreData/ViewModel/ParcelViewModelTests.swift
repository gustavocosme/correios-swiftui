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
        _ = ParcelCoreDataViewModel.deleteAll()
    }
    
    func test_create() {
        let create = ParcelCoreDataViewModel.save(title: "Teste", code: "12312312321")
        let list = ParcelCoreDataViewModel.getList()

        XCTAssertEqual(create, true)
        XCTAssertEqual(list.isEmpty, false)
    }
    
    func test_delete() {
        _ = ParcelCoreDataViewModel.save(title: "Teste", code: "12312312321")
        let list = ParcelCoreDataViewModel.getList()
        _ = ParcelCoreDataViewModel.delete(list[0])
        
        XCTAssertEqual(ParcelCoreDataViewModel.getList().count, 0)
    }
}
