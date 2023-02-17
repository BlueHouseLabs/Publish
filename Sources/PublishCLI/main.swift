/**
*  Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import Foundation
import Publish
import Files
import ShellOut
import Codextended
import PublishCLICore

let cli = CLI(
    publishRepositoryURL: URL(
        string: "https://github.com/BlueHouseLabs/Publish.git"
    )!,
    publishVersion: "0.10.0"
)

do {
    try cli.run()
} catch {
    fputs("❌ \(error)\n", stderr)
    exit(1)
}
