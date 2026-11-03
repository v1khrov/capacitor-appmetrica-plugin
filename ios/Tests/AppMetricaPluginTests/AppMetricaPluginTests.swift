import XCTest
@testable import AppMetricaPlugin

class AppMetricaPluginTests: XCTestCase {

    func testToECommerceAmount() throws {
        let amount = try Converter.toECommerceAmount(amount: [10.5, "USD"])

        XCTAssertEqual(amount.unit, "USD")
        XCTAssertEqual(amount.value, NSDecimalNumber(value: 10.5))
    }

    func testToECommerceAmountRejectsInvalidInput() {
        XCTAssertThrowsError(try Converter.toECommerceAmount(amount: []))
        XCTAssertThrowsError(try Converter.toECommerceAmount(amount: ["USD", 10.5]))
    }

    func testToECommercePriceRequiresFiat() {
        XCTAssertThrowsError(try Converter.toECommercePrice(price: [:]))
    }

    func testToConfigRequiresApiKey() {
        XCTAssertThrowsError(try Converter.toConfig(config: [:]))
    }
}
