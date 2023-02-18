//
//  PathResolver.swift
//  
//
//  Created by Eric DeLabar on 2/18/23.
//

import Files

public extension [Path] {
    
    func asResolvedPathStrings(forCodeFile file: StaticString = #file) -> [String] {
        do {
            let folder = try packageFolder(forPath: Path("\(file)"))
            return try map { (try folder.subfolder(at: $0.string)).path }
        } catch {
            print("Error converting [Path] to [File]: \(error)")
            return []
        }
    }
    
}

public func packageFolder(forPath path: Path) throws -> Folder {
    let codeFile = try File(path: path.string)
    return try codeFile.resolveSwiftPackageFolder()
}
