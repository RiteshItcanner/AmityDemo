//
//  ViewController.swift
//  amityy
//
//  Created by Ritesh Sinha on 27/05/24.
//

import UIKit
import AmitySDK
import AmityUIKit

class ViewController: UIViewController {
    
    //    var token: AmityNotificationToken?
    //    var amityClient: AmityClient!
    //    var postRepository: AmityPostRepository!
    
    var amityClient: AmityClient!
    var postRepository: AmityPostRepository!
    var notificationToken: AmityNotificationToken?
    var posts: [AmityObject<AmityPost>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //         Assuming amityClient is already initialized in AppDelegate
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            amityClient = appDelegate.amityClient
//            postRepository = AmityPostRepository(client: amityClient)
//            Task {
//                //                await createPost()
//                do {
//                    let isEnabled = try await amityClient.presence.isEnabled()
//                    print(isEnabled)
//                } catch let error {
//                    // Handle error here
//                    print(error.localizedDescription)
//                }
//            }
//            
//        }
    }
    
    @IBAction func onClickBtn(_ sender: Any) {
//        let viewController = AmityCommunityHomePageViewController.make()
//
//        // push
//        navigationController?.pushViewController(viewController, animated: true)
//
//        // present
//        let navigationController = UINavigationController(rootViewController: viewController)
//        present(navigationController, animated: true, completion: nil)

        let viewController = AmityCommunityFeedViewController.make(communityId: "123")
        // push
        navigationController?.pushViewController(viewController, animated: true)

        // present
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
        
    }
    
    
//    func loginUser() {
//        Task {
//            do {
//                try await amityClient.login(userId: "<user-id>", displayName: "<display-name>", authToken: nil, sessionHandler: MySessionHandler())
//                print("Finish logging in")
//            } catch {
//                print("error: \(String(describing: error))")
//            }
//        }
//    }
        
        func getPostByIdExample() {
            notificationToken = postRepository.getPost(withId: "<post-id>").observe { liveObject, error in
                // Observer block, Do something here
            }
        }
        
        //    func observePostById() {
        //        let postId = "<post-id>" // Replace "<post-id>" with the actual post ID
        //
        //        // Observe the post by its ID
        //        notificationToken = postRepository.getPost(withId: postId).observe { [weak self] (liveObject, error) in
        //            if let error = error {
        //                print("Error observing post: \(error.localizedDescription)")
        //            } else {
        //                // Use optional binding to safely unwrap liveObject
        //                if let post = liveObject {
        //                    // Access the post's ID using alternative method
        //                    if let postId = self?.getPostId(from: post) {
        //                        print("Observed Post ID: \(postId)")
        //                    } else {
        //                        print("Post ID not available")
        //                    }
        //                } else {
        //                    print("Live object is nil")
        //                }
        //            }
        //        }
        //    }
        
        func createPost() async {
            // Build your post structure
            let builder = AmityTextPostBuilder()
            builder.setText("ABC")
            // Create a post from builder
            do {
                let post = try await postRepository.createTextPost(builder, targetId: nil, targetType: .user, metadata: nil, mentionees: nil)
            } catch {
                // Handle error here
            }
            
        }
        
        
        //    func observePostChanges() {
        //            // Observe post changes
        //            notificationToken = postRepository.observeQuery(.all)
        //                .observe { [weak self] (_, error) in
        //                    if let error = error {
        //                        print("Error observing post changes: \(error.localizedDescription)")
        //                    } else {
        //                        // Fetch updated post data
        //                        self?.fetchPosts()
        //                    }
        //                }
        //        }
        
        //    func fetchPosts() {
        //            // Fetch posts from the repository
        //            postRepository.getAll { [weak self] (posts, error) in
        //                if let error = error {
        //                    print("Error fetching posts: \(error.localizedDescription)")
        //                } else if let posts = posts {
        //                    // Update the data source
        //                    self?.posts = posts
        //                    // Reload table view to reflect changes
        //                    self?.tableView.reloadData()
        //                }
        //            }
        //        }
        //
        //    func getPostId(from post: AmityObject<AmityPost>) -> String? {
        //            // Implement your logic here to extract the post ID from the AmityObject<AmityPost>
        //            // For example, if the ID is stored in a property called 'id' or 'postID':
        //            // return post.id or post.postID
        //            // Replace this with the actual property or method from the SDK
        //            return nil
        //        }
        
        
    }

