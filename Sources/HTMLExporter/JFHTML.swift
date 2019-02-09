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
    
    public init() {
        append("<html>")
        increaseIndent()
        append("<head>")
        increaseIndent()
        // Start HEAD info
        append("<title>Quests</title>")
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
    
    public func addTableRow(_ data: [String]) {
        append("<tr>")
        increaseIndent()
        for d in data {
            if d.contains("\n") {
                append("<td>")
                increaseIndent()
                append(d)
                decreaseIndent()
                append("</td>")
            } else {
                append("<td>\(d)</td>")
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
