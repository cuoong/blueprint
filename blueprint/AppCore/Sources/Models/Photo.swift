import Foundation
import SwiftUI

public struct Photo: Codable {
    public let id: String
    public let createdAt: String?
    public let updatedAt: String?
    public let width: Int64
    public let height: Int64
    public let likes: Int64
    public let link: Link?
    public let imageUrl: ImageURL?
}
