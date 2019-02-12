//
//  JFHTML.swift
//  BetterQuestingParser
//
//  Created by Jonas Frey on 08.02.19.
//

import Foundation

/// Represents a website in HTML format
public class JFHTML: CustomStringConvertible {
    
    /// The number of spaces used for indenting (only for niceness of the .html file)
    private let indentSteps = 4
    
    /// The current level of indentation
    private var indent = 0
    
    /// The current html string
    private(set) public var html = ""
    
    public var description: String {
        return html
    }
    
    /// Creates a new HTML object
    ///
    /// - Parameter head: The Head information separated by lines
    public init(head: [String] = []) {
        append("<!DOCTYPE html>")
        append("<html>")
        increaseIndent()
        append("<head>")
        increaseIndent()
        
        append("<title>Quests</title>")
        for h in head {
            append(h)
        }
        
        decreaseIndent()
        append("</head>")
        append("<body>")
        increaseIndent()
    }
    
    /// Increases the internal indentation
    public func increaseIndent() {
        indent += indentSteps
    }
    
    /// Decreases the internal indentation
    public func decreaseIndent() {
        indent -= indentSteps
        if indent < 0 {
            indent = 0
        }
    }
    
    /// Appends a line of html code to the html file using the current indentation.
    ///
    /// - Parameters:
    ///   - string: The html code to append
    public func append(_ string: String) {
        let spacing = Array(repeating: " ", count: indent).joined(separator: "")
        html += spacing + string + "\n"
    }
    
    public static func +=(lhs: JFHTML, rhs: String) -> JFHTML {
        lhs.append(rhs)
        return lhs
    }
    
    /// Creates a new table using the given headers
    ///
    /// - Parameters:
    ///   - headers: The headers for the table
    ///   - id: The ID of the table
    public func openTable(_ headers: [String], id: String? = nil) {
        if let id = id {
            append("<table id=\"\(id)\">")
        } else {
            append("<table>")
        }
        increaseIndent()
        append("<tr>")
        increaseIndent()
        for header in headers {
            append("<th>\(header)</th>")
        }
        decreaseIndent()
        append("</tr>")
    }
    
    /// Finalizes the table
    public func closeTable() {
        decreaseIndent()
        append("</table>")
    }
    
    /// Appends a new table row with the given data and classes
    ///
    /// - Parameters:
    ///   - data: The data for the table row
    ///   - classes: The classes for each of the tds
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
    
    /// Finalizes the html
    public func finalize() {
        decreaseIndent()
        append("</body>")
        decreaseIndent()
        append("</html>")
    }
    
}
