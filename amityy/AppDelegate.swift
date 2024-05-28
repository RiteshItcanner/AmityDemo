//
//  AppDelegate.swift
//  amityy
//
//  Created by Ritesh Sinha on 27/05/24.
//

import UIKit
import AmityUIKit
import AmitySDK
import Combine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var cancellable: AnyCancellable?
    var amityClient: AmityClient!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
        AmityUIKitManager.setup(apiKey: "b0eaec0c6bd3a6364c648a4e010a15de820085b3ec633d7e", region: .global)
        
//        let endpoint = AmityEndpoint(httpUrl: "http-endpoint",
//                                     rpcUrl: "rpc-endpoint",
//                                     mqttHost: "mqtt-host")
//                
//        AmityUIKitManager.setup(apiKey: "api-key", endpoint: endpoint)
        
//        AmityUIKitManager.registerDevice(withUserId: "123", displayName: "John Doe", authToken: "e17aa3e0d42f3ea42e84aa2c4989f4bd8d7f201a", sessionHandler: MySessionHandler())
        
        // Perform user login to get authToken
        login(username: "user", password: "password") { authToken in
            guard let authToken = authToken else {
                print("Failed to fetch auth token")
                return
            }
            
            // Register the device with Amity
            AmityUIKitManager.registerDevice(withUserId: "id_123", displayName: "John Doe Test User", authToken: authToken, sessionHandler: MySessionHandler())
        }

        

        return true
    }
    
    func login(username: String, password: String, completion: @escaping (String?) -> Void) {
            let url = URL(string: "https://apix.sg.amity.co/api/v3/authentication/token")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

//            let body = ["username": username, "password": password]
            let body = ["userId": "123", "x-server-key": "8b6312588ccc4e2f73abf92624053586b54d655a80f8f86b97f8e1a24005dc3a13ac71e8be452956b46a635b21a1ecb856c2aa1b0efa6fed6f27a0666a"]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error logging in: \(error?.localizedDescription ?? "No error description")")
                    completion(nil)
                    return
                }

                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let authToken = json["authToken"] as? String {
                    completion(authToken)
                } else {
                    completion(nil)
                }
            }

            task.resume()
        }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

class MySessionHandler: SessionHandler {
    func sessionWillRenewAccessToken(renewal: any AmitySDK.AccessTokenRenewal) {
        print("sessionWillRenewAccessToken called")
    }
    
}
