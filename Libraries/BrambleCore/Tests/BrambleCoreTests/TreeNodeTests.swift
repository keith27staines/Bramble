//
//  TreeNodeTests.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

import XCTest
import BrambleCore

class TreeNodeTests: XCTestCase {

    // Sample struct to be used as a value in TreeNode
    struct SampleValue: Codable, Identifiable {
        var id: Int
        var name: String
    }

    var rootNode: TreeNode<SampleValue>!
    var childNode1: TreeNode<SampleValue>!
    var childNode2: TreeNode<SampleValue>!

    override func setUp() {
        super.setUp()
        rootNode = TreeNode(value: SampleValue(id: 1, name: "Root"))
        childNode1 = try! rootNode.createChild(value: SampleValue(id: 2, name: "Child 1"))
        childNode2 = try! rootNode.createChild(value: SampleValue(id: 3, name: "Child 2"))
    }

    override func tearDown() {
        rootNode = nil
        childNode1 = nil
        childNode2 = nil
        super.tearDown()
    }

    // Test creating a child
    func testCreateChild() throws {
        let childNode3 = try rootNode.createChild(value: SampleValue(id: 4, name: "Child 3"))
        XCTAssertNotNil(childNode3)
        XCTAssertEqual(childNode3.value.id, 4)
        XCTAssertEqual(rootNode.children.count, 3)
    }

    func testInsertSibling_beforeSpecifiedSibling() throws {
        let newSibling = try childNode1.createSibling(
            value: SampleValue(id: 5, name: "New Sibling"),
            direction: .before
        )
        XCTAssertEqual(newSibling.value.id, 5)
        XCTAssertEqual(rootNode.children.count, 3)
        XCTAssertEqual(rootNode.children[1].value.id, 5)
    }
    
    func testInsertSibling_afterSpecifiedSibling() throws {
        let newSibling = try childNode1.createSibling(
            value: SampleValue(id: 5, name: "New Sibling"),
            direction: .after
        )
        XCTAssertEqual(newSibling.value.id, 5)
        XCTAssertEqual(rootNode.children.count, 3)
        XCTAssertEqual(rootNode.children[2].value.id, 5)
    }

    // Test removing a child
    func testRemoveChild() {
        XCTAssertEqual(rootNode.children.count, 2)
        rootNode.removeChild(childNode1)
        XCTAssertEqual(rootNode.children.count, 1)
    }

    // Test finding a child by id
    func testFindChildById() {
        XCTAssertNotNil(rootNode.findChild(with: 2))  // Child 1
        XCTAssertNil(rootNode.findChild(with: 999))  // Non-existent child
    }

    // Test removing a node from parent
    func testRemoveFromParent() {
        XCTAssertEqual(childNode1.parent?.value.id, rootNode.value.id)
        childNode1.removeFromParent()
        XCTAssertNil(childNode1.parent)
    }

    // Test invalid insert sibling (no parent)
    func testInsertSiblingNoParent() {
        let orphanNode = TreeNode(value: SampleValue(id: 6, name: "Orphan"))
        XCTAssertThrowsError(try orphanNode.insertSibling(to: TreeNode(value: SampleValue(id: 7, name: "Sibling")), direction: .after)) { error in
            XCTAssertEqual(error as? TreeNode<SampleValue>.TreeNodeError, .noParent)
        }
    }

    // Test invalid child removal (child not found)
    func testRemoveChildNotFound() {
        let nonExistentChild = TreeNode(value: SampleValue(id: 999, name: "Non-existent"))
        rootNode.removeChild(nonExistentChild)
        XCTAssertEqual(rootNode.children.count, 2)
    }
}
