//
//  linkedList.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 11/4/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// This class defines the @linkedList

import UIKit

public class linkedList<AnyType: Equatable>: NSObject {
    
    public typealias NodeType = Node<AnyType>
    
    public var head: NodeType? {
        didSet {
            if head == nil {
                tail = head
            }
        }
    }
    
    public var tail: NodeType? {
        didSet {
            if head == nil {
                head = tail
            }
        }
    }
    
    public private(set) var theSize: Int = 0
    
    public func size() -> Int {
        return theSize
    }
    
    public func isEmpty() -> Bool {
        return size() == 0
    }
    
    public func findIndex(carToBeFound: AnyType) -> Int {
        var index: Int = 0;
        for node in self {
            
            if node.value == carToBeFound {
                return index
            } else {
                index += 1
            }
        }
        return -1
    }
    
    public func remove(node: NodeType){
        
            let nextNode = node.next
            let previousNode = node.previous
            
            if node === head && node === tail {
                head = nil
                tail = nil
            }
            else if node === head {
                head = node.next
            } else if node === tail {
                tail = node.previous
            } else {
                previousNode?.next = nextNode
                nextNode?.previous = previousNode
            }
            
            theSize -= 1
            assert(
                (tail != nil && head != nil && theSize >= 1) || (tail == nil && head == nil && theSize == 0),
                "Internal invariant not upheld at the end of remove"
            )
        
    }
    
    public func remove(atIndex index: Int) {
        precondition(index >= 0 && index < theSize, "Index \(index) out of bounds")
        
        // Find the node
        let result = iterate {
            if $1 == index {
                return $0
            }
            return nil
        }
        
        // Remove the node
        remove(node: result!)
    }
    
    public func append(value: AnyType) {
        let oldTail = tail
        tail = NodeType(value: value)
        
        tail?.previous = oldTail
        oldTail?.next = tail
        
        theSize += 1
    }
    
    public func nodeAt(index: Int) -> NodeType {
        precondition(index >= 0 && index < theSize, "Index \(index) out of bounds")
        
        let result = iterate {
            if $1 == index {
                return $0
            }
            
            return nil
        }
        
        return result!
    }
    
    /// Return the value at a given index
    ///
    /// - complexity: O(n)
    /// - parameter index: The index in the list
    ///
    /// - returns: The value at the provided index.
    public func valueAt(index: Int) -> AnyType {
        let node = nodeAt(index: index)
        return node.value
    }
    
    public func iterate(block: (_ node: NodeType, _ index: Int) throws -> NodeType?) rethrows -> NodeType? {
        var node = head
        var index = 0
        
        while node != nil {
            let result = try block(node!, index)
            if result != nil {
                return result
            }
            index += 1
            node = node?.next
        }
        
        return nil
    }
    
    
    
    /// Create a new LinkedList
    ///
    /// - returns: An empty LinkedList
    public override init() {
        
    }
    
    /// Create a new LinkedList with a sequence
    ///
    /// - parameter: A sequence
    /// - returns: A LinkedList containing the elements of the provided sequence
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == AnyType {
        super.init()
        for element in elements {
            append(value: element)
        }
    }

}

extension linkedList: Sequence {
    public typealias Iterator = LinkedListIterator<AnyType>
    
    public func makeIterator() -> linkedList.Iterator {
        return LinkedListIterator(startNode: head)
    }
}

public struct LinkedListIterator<AnyType: Equatable>: IteratorProtocol {
    public typealias Element = Node<AnyType>
    
    /// The current node in the iteration
    private var currentNode: Element?
    
    public init(startNode: Element?) {
        currentNode = startNode
    }
    
    public mutating func next() -> LinkedListIterator.Element? {
        let node = currentNode
        currentNode = currentNode?.next
        
        return node
    }
}

public class Node<AnyType: Equatable>  {
    typealias NodeType = Node<AnyType>
    
    /// The value contained in this node
    public let value: AnyType
    var next: NodeType? = nil
    var previous: NodeType? = nil
    
    public init(value: AnyType) {
        self.value = value
    }
}
