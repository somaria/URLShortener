//
//  ViewModel.swift
//  ViewModel
//
//  Created by admin on 14/8/21.
//

import SwiftUI

class ViewModel: ObservableObject {
  
  @Published var models = [Model]()
  
  func submit(urlString: String) {
    print("submitting again")
    
    guard URL(string: urlString) != nil else { return }
    
    print(urlString)
    
    guard let apiUrl = URL(string: "https://api.1pt.co/addURL?long=" + urlString.lowercased()) else { return }
    
    print(apiUrl)
    
    let task = URLSession.shared.dataTask(with: apiUrl) { data, _, error in
      
      guard let data = data, error == nil else { return }
      
      do {
        let result = try JSONDecoder().decode(APIResponse.self, from: data)
        
        let long = result.long
        let short = result.short
        let status = result.status
        
        print(long)
        print(short)
        print(status)
        
        DispatchQueue.main.async {
          self.models.append(.init(long: long, short: short))
          print(self.models[0].short)
        }
        
        print("89fd")
        
        
        
      } catch {
        print(error)
      }
    }
    
    task.resume()
    
  }
}

struct Model: Hashable {
  let long: String
  let short: String
}

struct APIResponse: Codable {
  let status: Int
  let message: String
  let short: String
  let long: String
}



//https://api.1pt.co/addURL?long=https://apple.com
/*
 {
 status: 201,
 message: "Added!",
 short: "btkwp",
 long: "https://apple.com"
 }
 */

