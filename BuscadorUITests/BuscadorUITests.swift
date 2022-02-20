//
//  BuscadorUITests.swift
//  BuscadorUITests
//
//  Created by Gustavo Cosme on 31/12/21.
//

import XCTest

class BuscadorUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testeCreateParcel() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Encomendas"].tap()
        app.navigationBars["Encomendas"].buttons["Add"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let informeOTituloTextField = elementsQuery.textFields["* Informe o titulo"]
        informeOTituloTextField.tap()
        informeOTituloTextField.tap()
        
        let aa123456789brTextField = elementsQuery.textFields["* AA123456789BR"]
        aa123456789brTextField.tap()
        aa123456789brTextField.tap()
        elementsQuery.buttons["Cadastrar"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
