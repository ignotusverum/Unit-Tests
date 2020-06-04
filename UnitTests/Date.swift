//
//  Date.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation

public enum DateFormat: String {
    case iso1801Full = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    case yyyyMMdd_HHmmss = "yyyy-MM-dd HH:mm:ss"
    case EEEE_MMMM_d = "EEEE, MMMM d"
    case MMMM_d_YYYY = "MMMM d, yyyy"
    case MMM_d_YYYY = "MMM. d, yyyy"
    case MM_dd_YYYY = "MM/dd/yyyy"
    case yyyy_MM_dd = "yyyy-MM-dd"
    case MM_yyyy = "MM/yyyy"
    case MMMM_d = "MMMM d"
    case YY_MM_dd = "YY-MM-dd"
    case h_mm_a = "h:mm a"
    case HH_mm = "HH:mm"
}

public extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.iso1801Full.rawValue
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
