@propertyDelegate
public struct Children<Value>
    where Value: Model
{
    var name: String?
    var dataType: DatabaseSchema.DataType?
    var constraints: [DatabaseSchema.FieldConstraint]

    public var value: [Value] {
        get { fatalError() }
        set { fatalError() }
    }

    public init() {
        self.name = nil
        self.dataType = nil
        self.constraints = []
    }
}

//{
//    public let id: ModelField<Child, Parent.ID>
//
//    public init(_ id: ModelField<Child, Parent.ID>) {
//        self.id = id
//    }
//
//    func encode(to encoder: inout ModelEncoder, from storage: ModelStorage) throws {
//        #warning("TODO: fixme")
//    }
//
//    func decode(from decoder: ModelDecoder, to storage: inout ModelStorage) throws {
//        #warning("TODO: fixme")
//    }
//}
//
//
//
//extension Model {
//    public typealias Children<ChildType> = ModelChildren<Self, ChildType>
//        where ChildType: Model
//
//
//    public typealias ChildrenKey<ChildType> = KeyPath<Self, Children<ChildType>>
//        where ChildType: Model
//
//
//    public static func children<T>(forKey key: ChildrenKey<T>) -> Children<T> {
//        return self.shared[keyPath: key]
//    }
//}
//
//extension ModelRow {
//    public func query<Child>(_ key: Model.ChildrenKey<Child>, on database: Database) -> QueryBuilder<Child>
//        where Child: FluentKit.Model
//    {
//        let children = Model.children(forKey: key)
//        return database.query(Child.self)
//            .filter(children.id, .equal, self.id!)
//    }
//
//    public subscript<Child>(_ key: Model.ChildrenKey<Child>) -> [Child.Row]
//        where Child: FluentKit.Model
//    {
//        guard let cache = self.storage.eagerLoads[Child.entity] else {
//            fatalError("No cache set on storage.")
//        }
//        return try! cache.get(id: self.id!)
//            .map { $0 as! Child.Row }
//    }
//}
