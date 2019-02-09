//
//  JFHTML.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 08.02.19.
//

import Foundation

public class JFHTML: CustomStringConvertible {
    
    private let indentSteps = 4
    
    private var indent = 0
    private(set) public var html = ""
    public var description: String {
        return html
    }
    
    public init(head: [String] = []) {
        append("<html>")
        increaseIndent()
        append("<head>")
        increaseIndent()
        // Start HEAD info
        append("<title>Quests</title>")
        for h in head {
            append(h)
        }
        // End HEAD info
        decreaseIndent()
        append("</head>")
        append("<body>")
        increaseIndent()
    }
    
    public func increaseIndent() {
        indent += indentSteps
    }
    
    public func decreaseIndent() {
        indent -= indentSteps
        if indent < 0 {
            indent = 0
        }
    }
    
    public func append(_ string: String, terminator: String = "\n") {
        let spacing = Array(repeating: " ", count: indent).joined(separator: "")
        html += spacing + string + terminator
    }
    
    public static func +=(lhs: JFHTML, rhs: String) -> JFHTML {
        lhs.append(rhs)
        return lhs
    }
    
    public func openTable(_ headers: [String]) {
        append("<table>")
        increaseIndent()
        append("<tr>")
        increaseIndent()
        for header in headers {
            append("<th>\(header)</th>")
        }
        decreaseIndent()
        append("</tr>")
    }
    
    public func closeTable() {
        decreaseIndent()
        append("</table>")
    }
    
    public func addTableRow(_ data: [String], classes: [String]? = nil) {
        precondition(classes == nil || data.count == classes!.count)
        append("<tr>")
        increaseIndent()
        for i in 0..<data.count {
            let d = data[i]
            var tdWithClass = ""
            if let c = classes?[i] {
                tdWithClass = "<td class=\"\(c)\">"
            } else {
                tdWithClass = "<td>"
            }
            
            if d.contains("\n") {
                append(tdWithClass)
                increaseIndent()
                append(d)
                decreaseIndent()
                append("</td>")
            } else {
                append("\(tdWithClass)\(d)</td>")
            }
        }
        decreaseIndent()
        append("</tr>")
    }
    
    public func finalize() {
        decreaseIndent()
        append("</body>")
        decreaseIndent()
        append("</html>")
    }
    
}
