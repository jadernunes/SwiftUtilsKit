//
//  SystemInfo.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import Foundation

public protocol ISystemInfo {
    var appVersionAndBuild: String { get }
    var appVersion: String { get }
    var appBuild: String { get }
}

public struct SystemInfo: ISystemInfo {
    
    // MARK: - Properties
    
    private let bundle: Bundle
    
    // MARK: - Life cycle
    
    public init(bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }
    
    // MARK: - Methods
    
    /// Returns the version number plus build number together.
    /// - Note: Ex.: versionNumber + buildNumber
    /// - Returns: "10001"
    public var appVersionAndBuild: String {
        let versionNumber = appVersion.removeCharacters()
        let buildNumber = appBuild.removeCharacters()
        return versionNumber + buildNumber
    }
    
    public var appVersion: String {
        let dictionary = bundle.infoDictionary
        let version = dictionary?["CFBundleShortVersionString"] as? String
        return version ?? ""
    }
    
    public var appBuild: String {
        let dictionary = bundle.infoDictionary
        let build = dictionary?["CFBundleVersion"] as? String
        return build ?? ""
    }
}
