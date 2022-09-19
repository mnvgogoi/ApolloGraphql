//
//  Network.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 12/09/22.
//

import Foundation
import Apollo

class Network{
    static let shared = Network()
    //private(set) lazy var apollo = ApolloClient(url: URL(string: "https://app.vantagecircle.in/api/feed/graphql")!)
    
    
        private(set) lazy var apollo: ApolloClient = {
                let cache = InMemoryNormalizedCache()
                let store = ApolloStore(cache: cache)
    
                let authPayloads = ["x-xsrf-token": "b62d4b48-7369-4bee-9d93-15abd12f3f0d"]
                let configuration = URLSessionConfiguration.default
                configuration.httpAdditionalHeaders = authPayloads
    
                let client = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
                let provider = DefaultInterceptorProvider(client: client, store: store)
                let url = URL(string: "https://app.vantagecircle.in/api/feed/graphql")!
                let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                             endpointURL: url)
                return ApolloClient(networkTransport: transport, store: store)
            }()
    
    
    //MARK: - QUERIES
    
    func getData(completion: @escaping ([GetAllFeedsQuery.Data.FeedsV2]) -> Void){
        apollo.fetch(query: GetAllFeedsQuery(reqdTypes: ["*"], offset: 0, limit: 10)) { result in
            switch result {
            case .success(let graphQLResult):
//                print("Success! Result: \(graphQLResult)")
                if let resultData = graphQLResult.data?.feedsV2{
                    completion(resultData)
                }
                else{
                    print("no data--")
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    
    func getLikedUsersForParticularFeed(completion: @escaping (GetLikedUsersForParticularFeedQuery.Data.FeedsV2.Like) -> Void, feedID: Int!){
        apollo.fetch(query: GetLikedUsersForParticularFeedQuery(reqdTypes: ["*"], offset: 0, limit: 1, feedId: feedID)) { result in
            switch result {
            case .success(let graphQLResult):
//                print("Success! Result: \(graphQLResult.data?.feedsV2![0].feedId)")
                if let resultData = graphQLResult.data?.feedsV2![0].likes{
                    completion(resultData)
                }
                else{
                    print("no data--")
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    func getCommentsForParticularFeed(completion: @escaping (GetCommentsQuery.Data.FeedsV2.Comment) -> Void, feedID: Int!){
        apollo.fetch(query: GetCommentsQuery(reqdTypes: ["*"], offset: 0, limit: 1, feedId: feedID)) { result in
            switch result {
            case .success(let graphQLResult):
//                print("Success! Result: \(graphQLResult.data?.feedsV2![0].feedId)")
                if let resultData = graphQLResult.data?.feedsV2![0].comments{
                    completion(resultData)
                }
                else{
                    print("no data--")
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    //MARK: - MUTATIONS
    func addComment(feedID: Int!, commentText: String!, isReply: Bool!){
        apollo.perform(mutation: AddCommentMutation(feedId: feedID, commentText: commentText, isReply: isReply))
    }
}

