//
//  TreeNode.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

/// A node in a tree structure, where each node holds a value and can have child nodes.
@available(macOS 10.15, *)
public final class TreeNode<Value: Codable & Identifiable>: Codable, Identifiable where Value.ID: Codable {
    
    /// The unique identifier for this node.
    public let id: Value.ID
    /// The value stored at this node.
    public var value: Value
    /// A list of child nodes of this node.
    public private(set) var children: [TreeNode<Value>] = []
    /// The parent node of this node, if it exists.
    public private(set) weak var parent: TreeNode<Value>?
    
    /// Enum for sibling insertion direction. Determines whether a sibling is inserted before or after the current node.
    public enum Direction {
        case before  // Insert sibling before the current node.
        case after // Insert sibling after the current node.
    }

    /// Errors that may occur during tree operations.
    public enum TreeNodeError: Error {
        // Thrown when the node has no parent but one was expected
        case noParent
        // Thrown when a node already has a parent but none was expected.
        case alreadyHasParent
        // Thrown when a child node cannot be found but was expected
        case childNotFound
    }

    /// Initializes a new `TreeNode` with a given value.
    ///
    /// - Parameter value: The value to store in the node.
    public init(value: Value) {
        self.id = value.id
        self.value = value
    }

    /// Creates and inserts a new child node at the beginning of the children array.
    ///
    /// - Parameter value: The value for the new child node.
    /// - Returns: The newly created child node.
    /// - Throws: TreeNodeError if the child could not be inserted
    public func createChild(value: Value) throws  -> TreeNode<Value> {
        let child = TreeNode<Value>(value: value)
        try insertChild(child)
        return child
    }
    
    /// Inserts a child node at the beginning of the children array.
    ///
    /// - Parameter child: The child node to insert.
    /// - Throws: A`TreeNodeError` if the child node being inserted already has a parent
    public func insertChild(_ child: TreeNode<Value>) throws  {
        guard child.parent == nil else { throw TreeNodeError.alreadyHasParent }
        child.parent = self
        children.insert(child, at: 0)
    }
    
    /// Creates a sibling for this node and inserts it at a specified direction relative to this node.
    ///
    /// - Parameters:
    ///   - value: The value for the new sibling node.
    ///   - direction: The direction to insert the sibling in relation to this node.
    /// - Returns: The newly created sibling node.
    /// - Throws: A `TreeNodeError` if there is no parent, or if the new sibling already has a parent.
    public func createSibling(
        value: Value,
        direction: Direction
    ) throws  -> TreeNode<Value> {
        let newSibling = TreeNode(value: value)
        try insertSibling(to: newSibling, direction: direction)
        return newSibling
    }
    
    /// Inserts an existing node as a sibling to this node at a specified direction.
    ///
    /// - Parameters:
    ///   - node: The node to insert as a sibling.
    ///   - direction: The direction to insert the sibling in relation to this node.
    /// - Throws: A `TreeNodeError` if the parent is not found, or if the sibling node already has a parent.
    public func insertSibling(to node: TreeNode<Value>, direction: Direction) throws  {
        guard let parent = self.parent else { throw TreeNodeError.noParent }
        guard node.parent == nil else { throw TreeNodeError.alreadyHasParent }
        
        // Find the index of the node
        guard let index = parent.children.firstIndex(where: { $0.id == self.id }) else {
            throw TreeNodeError.childNotFound
        }
        
        switch direction {
        case .before:
            parent.children.insert(node, at: index)
        case .after:
            parent.children.insert(node, at: index + 1)
        }
    }

    /// Removes the specified child node from this node's children.
    public func removeChild(_ child: TreeNode<Value>) {
        guard let index = children.firstIndex(where: { $0.id == child.id }) else {
            return
        }
        children.remove(at: index)
        child.parent = nil
    }

    /// Removes this node from its parent's children
    ///
    /// If this node does not have a parent, no operation is performed
    public func removeFromParent() {
        guard let parent = self.parent else { return }
        parent.removeChild(self)
    }
    
    /// Finds a child node by its identifier.
    ///
    /// - Parameter id: The identifier of the child node to search for.
    /// - Returns: The child node if found, otherwise `nil`.
    public func findChild(with id: Value.ID) -> TreeNode<Value>? {
        if let child = children.first(where: { $0.id == id }) {
            return child
        }
        
        for child in children {
            if let foundChild = child.findChild(with: id) {
                return foundChild
            }
        }
        return nil
    }
}
