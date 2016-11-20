//
//  Branch.swift
//  GitBranch
//
//  Created by Ueoka Kazuya on 2016/10/16.
//  Copyright © 2016年 Fromkk. All rights reserved.
//

import Foundation

struct Branch {
    private enum Constants {
        static let defaultBranch: String = "master"
        static let plistFileName: String = "Branch"
        static let branchNameKey: String = "branch"
    }
    
    static var current: String {
        guard let path: String = Bundle.main.path(forResource: Constants.plistFileName, ofType: "plist") else {
            return Constants.defaultBranch
        }
        guard let plist: [String: String] = NSDictionary(contentsOfFile: path) as? [String: String] else {
            return Constants.defaultBranch
        }
        return plist[Constants.branchNameKey] ?? Constants.defaultBranch
    }
}
