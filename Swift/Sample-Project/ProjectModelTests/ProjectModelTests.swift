//
//  ProjectModelTests.swift
//  ProjectModelTests
//
//  Created by Erico Gimenes Teixeira on 15/07/19.
//  Copyright © 2019 Erico Gimenes Teixeira. All rights reserved.
//

import XCTest

class ProjectModelTests: XCTestCase {

    //MARK: - Properties:
    
    //var animation:UIImage?
    
    //MARK: - Class Methods
    
    override class func setUp() {
        // The setUp() class method is called exactly once for a test case, before its first test method is called. Override this method to customize the initial state for all tests in the test case.
        
    }
    
    override class func tearDown() {
        // The tearDown() class method is called exactly once for a test case, after its final test method completes. Override this method to perform any cleanup after all test methods have ended.
        
    }
    
    //MARK: - Instance Methods
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //animation = UIImage.init(named: "animation.gif")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Tests
    
    //******************************************************************************************************
    //MARK: - Commum
    //******************************************************************************************************
    
    func testDecodeToImage(){
        let text = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAABJ5JREFUWAntVmtsVFUQnnP20YcN3e4DQWIIuF27lKYUf0AbNIAhxPgHURu0PzT1lYAviC3dJYYidndFQ2MTAU00CgGDr8RoRE0MGoPVIKmAi7Rb0agYs48uVaBsd+8dv1N7k81Nb631Jz3JZs458/ruzJyZJZpZMxG42iMgJguAP5psIBItgkVylpQvn+hwD08mPx2eJYBALFuva/mvYbRUGRZCfDOv0bvi81WiMB1HVjp2KwZp+XvAK4XnlYjAGmZ92/ne1Ebc9Rg6zCwCsaH1TPpiKcUR1qiFWG8lQUkpbJv6Q56PDVkrahkBf1dqMxHvFtJ2l/MG9we5RPp7GPYSi8dJcKtguoaJszC8tti4ihTuFxBTRYnNHox3uH8p5pv30nxhnMuk43UhKEOs7cr9oTJAW4i5ikg/AOf1kLsev7UA1esgex0kxhzZhH2DjezrwSvP6drzhj0ragngdMiVZZJPM9NCeSmzJRH2fQgjnyhDLLjd6ShbKkj8ierwXNtUdVbiTvEKVHi0P+w+BsRvAnBzIJK8Wd1bLUsASqHB73kFX3iadT0c7E7NFXa5GU5RhOLeeHsF4kI74SSgamMgNPswnH4pdHqsNjrsZ5tUgC4ziRc7mS39WDIUgLebhWYT8kkmqiiMcDSx1fsDQr0HTlcHouk7nH4vClIk4KTT38MliMwTqI98nnOBwa2e3yD7HAq14VAs3arsTbQsi7BYuLor+R4LsU7axPIS3Z64wqPK6cnBsO/WmlimSdO1h2d5fA+deETk736LbQq40m/czWWpK+mzcGIH2AXxZjFabFftpwQgEL2wkHn0DCq7byDsa6qJZOt0h5CJ9qrvzAbN5+LXlAh53jXzJ02BITwQcp0D0m6kYnl1JNPSv819airOlb5dlOxHKjT0hzsNe8XUMgKqcA5Gh+6DYlASf+ug8i9yNNIHZb3M6b3xVJu4VGxosr0/kjoKfn2D3+sz0mPIW0bgYCS9l1l7DU2lDQk9nBOXf4SSjvO8kXymwzAwFYqXcwSFW3XyXLbRLD8hAFVILOgBVMgxdLP5oA+iXHpxN0cZQFt+akl31mU2ZnW2Cf5M8XRdW22WmRCACpMg/hUzIIjkBQfDs19FI1pT7ii9joTciL6/17XEddFszOq8ocPbhzoYRr5vMctY1gCGzArWtPcRcjcazEcOKdvPdHjiZgNTOa88yvbzX6WOQ9bfEvZVdgq0q/FlCUDxa3ddnJMrjDyDbSueoJCSDjnIuSMeqhwc1/9XEuwaWpwn7Q0kbik+5PhAyLsMFA/qnzUpAENoUSxTO6rrzyL568ZaseAD0uHc2d/m+smQMVP11b/3ptoxsbejO/6l5opq7eZXMCUAhvGaaOomTacdSMvt+Io8vmqfs7SkM76lcsiQUbQmkmnUSNuHqbUIud9TKuydargVyxj7/wTAUKqOpJcBRBQRWYUXkiSybRoMe94JvpCdXxjNb0e27gfvUzW8xuaHoTgBnRYAw44aSKzzSwAzF6nBoCI/xvfP6r/D+Pg2RC3p/wKgrNZFL1TlKN+DqXcbekVMTciJho4lghnGVR+BvwH6H8XC/VMDhwAAAABJRU5ErkJggg=="
        if let image = UIImage.decodeToImage(base64String: text) {
            if image.size.height == 0 || image.size.width == 0{
                XCTAssert(false, "Imagem não identificada")
            }
        }else{
            XCTAssert(false, "Não existe imagem")
        }
    }
    
    func testAnimatedImageWithAnimatedGIF_URL() {
        
        if let animation = UIImage.animatedImageWithAnimatedGIF(url: Bundle.main.url(forResource: "animation", withExtension: "gif")!) {
            if let gif = animation.images {
                if gif.count == 0 {
                    XCTAssert(false)
                }
            }
        }
    }
    
    func testAnimatedImageWithAnimatedGIF_Data() {
        
        do {
            if let animation = UIImage.animatedImageWithAnimatedGIF(data: try Data.init(contentsOf: Bundle.main.url(forResource: "animation", withExtension: "gif")!)) {
                if let gif = animation.images {
                    if gif.count == 0 {
                        XCTAssert(false)
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
            XCTAssert(false)
        }
    }
    
    

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
