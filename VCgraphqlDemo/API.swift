// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllFeedsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllFeeds($reqdTypes: [String!]!, $offset: Int!, $limit: Int!) {
      feedsV2(reqdTypes: $reqdTypes, offset: $offset, limit: $limit) {
        __typename
        feedId
        feedType
        createdAt
        image
        name
        description
        sender {
          __typename
          ...NameAndID
        }
        receivers {
          __typename
          ...NameAndID
        }
        comments {
          __typename
          count
        }
        likes {
          __typename
          count
          users {
            __typename
            name
          }
          isLiked
        }
      }
    }
    """

  public let operationName: String = "GetAllFeeds"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + NameAndId.fragmentDefinition)
    return document
  }

  public var reqdTypes: [String]
  public var offset: Int
  public var limit: Int

  public init(reqdTypes: [String], offset: Int, limit: Int) {
    self.reqdTypes = reqdTypes
    self.offset = offset
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["reqdTypes": reqdTypes, "offset": offset, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("feedsV2", arguments: ["reqdTypes": GraphQLVariable("reqdTypes"), "offset": GraphQLVariable("offset"), "limit": GraphQLVariable("limit")], type: .list(.nonNull(.object(FeedsV2.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(feedsV2: [FeedsV2]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "feedsV2": feedsV2.flatMap { (value: [FeedsV2]) -> [ResultMap] in value.map { (value: FeedsV2) -> ResultMap in value.resultMap } }])
    }

    /// Returns the feeds with details version 2
    public var feedsV2: [FeedsV2]? {
      get {
        return (resultMap["feedsV2"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FeedsV2] in value.map { (value: ResultMap) -> FeedsV2 in FeedsV2(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FeedsV2]) -> [ResultMap] in value.map { (value: FeedsV2) -> ResultMap in value.resultMap } }, forKey: "feedsV2")
      }
    }

    public struct FeedsV2: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FeedDetailsV2"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("feedId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("feedType", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("sender", type: .object(Sender.selections)),
          GraphQLField("receivers", type: .list(.nonNull(.object(Receiver.selections)))),
          GraphQLField("comments", type: .nonNull(.object(Comment.selections))),
          GraphQLField("likes", type: .nonNull(.object(Like.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(feedId: Int, feedType: String, createdAt: String, image: String, name: String, description: String, sender: Sender? = nil, receivers: [Receiver]? = nil, comments: Comment, likes: Like) {
        self.init(unsafeResultMap: ["__typename": "FeedDetailsV2", "feedId": feedId, "feedType": feedType, "createdAt": createdAt, "image": image, "name": name, "description": description, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "receivers": receivers.flatMap { (value: [Receiver]) -> [ResultMap] in value.map { (value: Receiver) -> ResultMap in value.resultMap } }, "comments": comments.resultMap, "likes": likes.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var feedId: Int {
        get {
          return resultMap["feedId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "feedId")
        }
      }

      public var feedType: String {
        get {
          return resultMap["feedType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "feedType")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var image: String {
        get {
          return resultMap["image"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var sender: Sender? {
        get {
          return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "sender")
        }
      }

      public var receivers: [Receiver]? {
        get {
          return (resultMap["receivers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Receiver] in value.map { (value: ResultMap) -> Receiver in Receiver(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Receiver]) -> [ResultMap] in value.map { (value: Receiver) -> ResultMap in value.resultMap } }, forKey: "receivers")
        }
      }

      public var comments: Comment {
        get {
          return Comment(unsafeResultMap: resultMap["comments"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "comments")
        }
      }

      public var likes: Like {
        get {
          return Like(unsafeResultMap: resultMap["likes"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "likes")
        }
      }

      public struct Sender: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(NameAndId.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, id: Int) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameAndId: NameAndId {
            get {
              return NameAndId(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Receiver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(NameAndId.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, id: Int) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameAndId: NameAndId {
            get {
              return NameAndId(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CommentDetailsV2"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "CommentDetailsV2", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }

      public struct Like: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LikeDetails"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
            GraphQLField("isLiked", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int, users: [User], isLiked: Bool) {
          self.init(unsafeResultMap: ["__typename": "LikeDetails", "count": count, "users": users.map { (value: User) -> ResultMap in value.resultMap }, "isLiked": isLiked])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var users: [User] {
          get {
            return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
          }
        }

        public var isLiked: Bool {
          get {
            return resultMap["isLiked"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLiked")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "User", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class GetLikedUsersForParticularFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetLikedUsersForParticularFeed($reqdTypes: [String!]!, $offset: Int!, $limit: Int!, $feedId: Int!) {
      feedsV2(reqdTypes: $reqdTypes, offset: $offset, limit: $limit, feedId: $feedId) {
        __typename
        feedId
        feedType
        likes {
          __typename
          count
          users {
            __typename
            name
          }
          isLiked
        }
      }
    }
    """

  public let operationName: String = "GetLikedUsersForParticularFeed"

  public var reqdTypes: [String]
  public var offset: Int
  public var limit: Int
  public var feedId: Int

  public init(reqdTypes: [String], offset: Int, limit: Int, feedId: Int) {
    self.reqdTypes = reqdTypes
    self.offset = offset
    self.limit = limit
    self.feedId = feedId
  }

  public var variables: GraphQLMap? {
    return ["reqdTypes": reqdTypes, "offset": offset, "limit": limit, "feedId": feedId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("feedsV2", arguments: ["reqdTypes": GraphQLVariable("reqdTypes"), "offset": GraphQLVariable("offset"), "limit": GraphQLVariable("limit"), "feedId": GraphQLVariable("feedId")], type: .list(.nonNull(.object(FeedsV2.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(feedsV2: [FeedsV2]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "feedsV2": feedsV2.flatMap { (value: [FeedsV2]) -> [ResultMap] in value.map { (value: FeedsV2) -> ResultMap in value.resultMap } }])
    }

    /// Returns the feeds with details version 2
    public var feedsV2: [FeedsV2]? {
      get {
        return (resultMap["feedsV2"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FeedsV2] in value.map { (value: ResultMap) -> FeedsV2 in FeedsV2(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FeedsV2]) -> [ResultMap] in value.map { (value: FeedsV2) -> ResultMap in value.resultMap } }, forKey: "feedsV2")
      }
    }

    public struct FeedsV2: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FeedDetailsV2"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("feedId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("feedType", type: .nonNull(.scalar(String.self))),
          GraphQLField("likes", type: .nonNull(.object(Like.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(feedId: Int, feedType: String, likes: Like) {
        self.init(unsafeResultMap: ["__typename": "FeedDetailsV2", "feedId": feedId, "feedType": feedType, "likes": likes.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var feedId: Int {
        get {
          return resultMap["feedId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "feedId")
        }
      }

      public var feedType: String {
        get {
          return resultMap["feedType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "feedType")
        }
      }

      public var likes: Like {
        get {
          return Like(unsafeResultMap: resultMap["likes"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "likes")
        }
      }

      public struct Like: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LikeDetails"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
            GraphQLField("isLiked", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int, users: [User], isLiked: Bool) {
          self.init(unsafeResultMap: ["__typename": "LikeDetails", "count": count, "users": users.map { (value: User) -> ResultMap in value.resultMap }, "isLiked": isLiked])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var users: [User] {
          get {
            return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
          }
        }

        public var isLiked: Bool {
          get {
            return resultMap["isLiked"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLiked")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "User", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class GetCommentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetComments($reqdTypes: [String!]!, $offset: Int!, $limit: Int!, $feedId: Int!) {
      feedsV2(reqdTypes: $reqdTypes, offset: $offset, limit: $limit, feedId: $feedId) {
        __typename
        feedId
        feedType
        comments {
          __typename
          count
          info {
            __typename
            edges {
              __typename
              node {
                __typename
                commentId
                createdAt
                text
                user {
                  __typename
                  name
                  profilePic
                }
                likes {
                  __typename
                  count
                  users {
                    __typename
                    name
                  }
                  isLiked
                }
                replies {
                  __typename
                  count
                  info {
                    __typename
                    commentId
                    text
                    image
                    createdAt
                    isEdited
                    user {
                      __typename
                      name
                    }
                    likes {
                      __typename
                      count
                      users {
                        __typename
                        name
                      }
                      isLiked
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetComments"

  public var reqdTypes: [String]
  public var offset: Int
  public var limit: Int
  public var feedId: Int

  public init(reqdTypes: [String], offset: Int, limit: Int, feedId: Int) {
    self.reqdTypes = reqdTypes
    self.offset = offset
    self.limit = limit
    self.feedId = feedId
  }

  public var variables: GraphQLMap? {
    return ["reqdTypes": reqdTypes, "offset": offset, "limit": limit, "feedId": feedId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("feedsV2", arguments: ["reqdTypes": GraphQLVariable("reqdTypes"), "offset": GraphQLVariable("offset"), "limit": GraphQLVariable("limit"), "feedId": GraphQLVariable("feedId")], type: .list(.nonNull(.object(FeedsV2.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(feedsV2: [FeedsV2]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "feedsV2": feedsV2.flatMap { (value: [FeedsV2]) -> [ResultMap] in value.map { (value: FeedsV2) -> ResultMap in value.resultMap } }])
    }

    /// Returns the feeds with details version 2
    public var feedsV2: [FeedsV2]? {
      get {
        return (resultMap["feedsV2"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FeedsV2] in value.map { (value: ResultMap) -> FeedsV2 in FeedsV2(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FeedsV2]) -> [ResultMap] in value.map { (value: FeedsV2) -> ResultMap in value.resultMap } }, forKey: "feedsV2")
      }
    }

    public struct FeedsV2: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FeedDetailsV2"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("feedId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("feedType", type: .nonNull(.scalar(String.self))),
          GraphQLField("comments", type: .nonNull(.object(Comment.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(feedId: Int, feedType: String, comments: Comment) {
        self.init(unsafeResultMap: ["__typename": "FeedDetailsV2", "feedId": feedId, "feedType": feedType, "comments": comments.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var feedId: Int {
        get {
          return resultMap["feedId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "feedId")
        }
      }

      public var feedType: String {
        get {
          return resultMap["feedType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "feedType")
        }
      }

      public var comments: Comment {
        get {
          return Comment(unsafeResultMap: resultMap["comments"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "comments")
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CommentDetailsV2"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("info", type: .object(Info.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int, info: Info? = nil) {
          self.init(unsafeResultMap: ["__typename": "CommentDetailsV2", "count": count, "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var info: Info? {
          get {
            return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "info")
          }
        }

        public struct Info: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["commentsConnectionConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .list(.object(Edge.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "commentsConnectionConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge?]? {
            get {
              return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["commentsConnectionEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "commentsConnectionEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The item at the end of the edge.
            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CommentInfo"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("commentId", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                  GraphQLField("text", type: .nonNull(.scalar(String.self))),
                  GraphQLField("user", type: .nonNull(.object(User.selections))),
                  GraphQLField("likes", type: .nonNull(.object(Like.selections))),
                  GraphQLField("replies", type: .nonNull(.object(Reply.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(commentId: Int, createdAt: String, text: String, user: User, likes: Like, replies: Reply) {
                self.init(unsafeResultMap: ["__typename": "CommentInfo", "commentId": commentId, "createdAt": createdAt, "text": text, "user": user.resultMap, "likes": likes.resultMap, "replies": replies.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var commentId: Int {
                get {
                  return resultMap["commentId"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "commentId")
                }
              }

              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              public var text: String {
                get {
                  return resultMap["text"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "text")
                }
              }

              public var user: User {
                get {
                  return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "user")
                }
              }

              public var likes: Like {
                get {
                  return Like(unsafeResultMap: resultMap["likes"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "likes")
                }
              }

              public var replies: Reply {
                get {
                  return Reply(unsafeResultMap: resultMap["replies"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "replies")
                }
              }

              public struct User: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    GraphQLField("profilePic", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String, profilePic: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                public var profilePic: String? {
                  get {
                    return resultMap["profilePic"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "profilePic")
                  }
                }
              }

              public struct Like: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["LikeDetails"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("count", type: .nonNull(.scalar(Int.self))),
                    GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
                    GraphQLField("isLiked", type: .nonNull(.scalar(Bool.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(count: Int, users: [User], isLiked: Bool) {
                  self.init(unsafeResultMap: ["__typename": "LikeDetails", "count": count, "users": users.map { (value: User) -> ResultMap in value.resultMap }, "isLiked": isLiked])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var count: Int {
                  get {
                    return resultMap["count"]! as! Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "count")
                  }
                }

                public var users: [User] {
                  get {
                    return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
                  }
                  set {
                    resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
                  }
                }

                public var isLiked: Bool {
                  get {
                    return resultMap["isLiked"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "isLiked")
                  }
                }

                public struct User: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["User"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(name: String) {
                    self.init(unsafeResultMap: ["__typename": "User", "name": name])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }
                }
              }

              public struct Reply: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ReplyCommentDetails"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("count", type: .nonNull(.scalar(Int.self))),
                    GraphQLField("info", type: .nonNull(.list(.nonNull(.object(Info.selections))))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(count: Int, info: [Info]) {
                  self.init(unsafeResultMap: ["__typename": "ReplyCommentDetails", "count": count, "info": info.map { (value: Info) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var count: Int {
                  get {
                    return resultMap["count"]! as! Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "count")
                  }
                }

                public var info: [Info] {
                  get {
                    return (resultMap["info"] as! [ResultMap]).map { (value: ResultMap) -> Info in Info(unsafeResultMap: value) }
                  }
                  set {
                    resultMap.updateValue(newValue.map { (value: Info) -> ResultMap in value.resultMap }, forKey: "info")
                  }
                }

                public struct Info: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["ReplyCommentInfo"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("commentId", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("text", type: .nonNull(.scalar(String.self))),
                      GraphQLField("image", type: .scalar(String.self)),
                      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                      GraphQLField("isEdited", type: .nonNull(.scalar(Bool.self))),
                      GraphQLField("user", type: .nonNull(.object(User.selections))),
                      GraphQLField("likes", type: .nonNull(.object(Like.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(commentId: Int, text: String, image: String? = nil, createdAt: String, isEdited: Bool, user: User, likes: Like) {
                    self.init(unsafeResultMap: ["__typename": "ReplyCommentInfo", "commentId": commentId, "text": text, "image": image, "createdAt": createdAt, "isEdited": isEdited, "user": user.resultMap, "likes": likes.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var commentId: Int {
                    get {
                      return resultMap["commentId"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "commentId")
                    }
                  }

                  public var text: String {
                    get {
                      return resultMap["text"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "text")
                    }
                  }

                  public var image: String? {
                    get {
                      return resultMap["image"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "image")
                    }
                  }

                  public var createdAt: String {
                    get {
                      return resultMap["createdAt"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "createdAt")
                    }
                  }

                  public var isEdited: Bool {
                    get {
                      return resultMap["isEdited"]! as! Bool
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "isEdited")
                    }
                  }

                  public var user: User {
                    get {
                      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "user")
                    }
                  }

                  public var likes: Like {
                    get {
                      return Like(unsafeResultMap: resultMap["likes"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "likes")
                    }
                  }

                  public struct User: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["User"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(name: String) {
                      self.init(unsafeResultMap: ["__typename": "User", "name": name])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var name: String {
                      get {
                        return resultMap["name"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "name")
                      }
                    }
                  }

                  public struct Like: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["LikeDetails"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("count", type: .nonNull(.scalar(Int.self))),
                        GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
                        GraphQLField("isLiked", type: .nonNull(.scalar(Bool.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(count: Int, users: [User], isLiked: Bool) {
                      self.init(unsafeResultMap: ["__typename": "LikeDetails", "count": count, "users": users.map { (value: User) -> ResultMap in value.resultMap }, "isLiked": isLiked])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var count: Int {
                      get {
                        return resultMap["count"]! as! Int
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "count")
                      }
                    }

                    public var users: [User] {
                      get {
                        return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
                      }
                      set {
                        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
                      }
                    }

                    public var isLiked: Bool {
                      get {
                        return resultMap["isLiked"]! as! Bool
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "isLiked")
                      }
                    }

                    public struct User: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["User"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("name", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public init(name: String) {
                        self.init(unsafeResultMap: ["__typename": "User", "name": name])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      public var name: String {
                        get {
                          return resultMap["name"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "name")
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class AddCommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addComment($feedId: Int!, $commentText: String!, $isReply: Boolean!) {
      comment(feedId: $feedId, commentText: $commentText, isReply: $isReply) {
        __typename
        commentId
        createdAt
      }
    }
    """

  public let operationName: String = "addComment"

  public var feedId: Int
  public var commentText: String
  public var isReply: Bool

  public init(feedId: Int, commentText: String, isReply: Bool) {
    self.feedId = feedId
    self.commentText = commentText
    self.isReply = isReply
  }

  public var variables: GraphQLMap? {
    return ["feedId": feedId, "commentText": commentText, "isReply": isReply]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("comment", arguments: ["feedId": GraphQLVariable("feedId"), "commentText": GraphQLVariable("commentText"), "isReply": GraphQLVariable("isReply")], type: .nonNull(.object(Comment.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comment: Comment) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "comment": comment.resultMap])
    }

    /// Save comment
    public var comment: Comment {
      get {
        return Comment(unsafeResultMap: resultMap["comment"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CommentInfo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("commentId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commentId: Int, createdAt: String) {
        self.init(unsafeResultMap: ["__typename": "CommentInfo", "commentId": commentId, "createdAt": createdAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentId: Int {
        get {
          return resultMap["commentId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }
    }
  }
}

public struct NameAndId: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment NameAndID on User {
      __typename
      name
      id
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, id: Int) {
    self.init(unsafeResultMap: ["__typename": "User", "name": name, "id": id])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }
}
