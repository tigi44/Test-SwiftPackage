//
//  ContentView.swift
//  Test-SwiftPackage
//
//  Created by tigi KIM on 2021/12/09.
//

import SwiftUI
import SwiftPackage
import BlueViewFramework


struct ContentView: View {
    var body: some View {
        VStack {
            Text(title())
            Image("Ball", bundle: .spmBundle)
            Image(uiImage: UIImage.scheduleImage()!)
            
            BlueView()
                .frame(width: 100, height: 100)
        }
    }
    
    func title() -> String {
        
        guard let path = Bundle.spmBundle.path(forResource: "Contents", ofType: "json") else {
            return ""
        }
        
        do {
            
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String, String>
            
            return jsonResult["title"] ?? ""
        } catch {
            
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
