import XCTest
@testable import SwiftPackage

final class SwiftPackageTests: XCTestCase {
    
    func testBallImage() {
        XCTAssertNotNil(UIImage.ballImage())
    }
    
    func testScheduleImage() {
        XCTAssertNotNil(UIImage.scheduleImage())
    }
    
    func testContentJson() {
        
        guard let path = Bundle.module.path(forResource: "Contents", ofType: "json") else {
        
            XCTFail()
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String, String>
            
            XCTAssertEqual(jsonResult["title"], "test")
            
        } catch (let error) {
            
            XCTFail(error.localizedDescription)
        }
    }
}
