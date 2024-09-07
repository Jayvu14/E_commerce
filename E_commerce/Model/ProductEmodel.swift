import Foundation

// MARK: - Welcome
struct ProductEmodel: Codable {
    let products: [Product]
    let total, skip, limit: Int
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.products = try container.decode([Product].self, forKey: .products)
        self.total = try container.decode(Int.self, forKey: .total)
        self.skip = try container.decode(Int.self, forKey: .skip)
        self.limit = try container.decode(Int.self, forKey: .limit)
    }
}


// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.category = try container.decode(Category.self, forKey: .category)
        self.price = try container.decode(Double.self, forKey: .price)
        self.discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.brand = try container.decodeIfPresent(String.self, forKey: .brand)
        self.sku = try container.decode(String.self, forKey: .sku)
        self.weight = try container.decode(Int.self, forKey: .weight)
        self.dimensions = try container.decode(Dimensions.self, forKey: .dimensions)
        self.warrantyInformation = try container.decode(String.self, forKey: .warrantyInformation)
        self.shippingInformation = try container.decode(String.self, forKey: .shippingInformation)
        self.availabilityStatus = try container.decode(AvailabilityStatus.self, forKey: .availabilityStatus)
        self.reviews = try container.decode([Review].self, forKey: .reviews)
        self.returnPolicy = try container.decode(ReturnPolicy.self, forKey: .returnPolicy)
        self.minimumOrderQuantity = try container.decode(Int.self, forKey: .minimumOrderQuantity)
        self.meta = try container.decode(Meta.self, forKey: .meta)
        self.images = try container.decode([String].self, forKey: .images)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decode(Double.self, forKey: .width)
        self.height = try container.decode(Double.self, forKey: .height)
        self.depth = try container.decode(Double.self, forKey: .depth)
    }
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(CreatedAt.self, forKey: .createdAt)
        self.updatedAt = try container.decode(CreatedAt.self, forKey: .updatedAt)
        self.barcode = try container.decode(String.self, forKey: .barcode)
        self.qrCode = try container.decode(String.self, forKey: .qrCode)
    }
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rating = try container.decode(Int.self, forKey: .rating)
        self.comment = try container.decode(String.self, forKey: .comment)
        self.date = try container.decode(CreatedAt.self, forKey: .date)
        self.reviewerName = try container.decode(String.self, forKey: .reviewerName)
        self.reviewerEmail = try container.decode(String.self, forKey: .reviewerEmail)
    }   
}
