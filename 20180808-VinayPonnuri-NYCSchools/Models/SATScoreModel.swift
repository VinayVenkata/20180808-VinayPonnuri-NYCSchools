//
//  SATScoreModel.swift
//  20180808-VinayPonnuri-NYCSchools
//
//  Created by Vinay Ponnuri on 08/08/18.
//  Copyright © 2018 Vinay Ponnuri. All rights reserved.
//

import Foundation

struct SATScoreModel : Codable {
    let dbn : String?
    let numOfSatTestTakers : String?
    let satCriticalReadingAvgScore : String?
    let satMathAvgScore : String?
    let satWritingAvgScore : String?
    let schoolName : String?
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
        case schoolName = "school_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
        numOfSatTestTakers = try values.decodeIfPresent(String.self, forKey: .numOfSatTestTakers)
        satCriticalReadingAvgScore = try values.decodeIfPresent(String.self, forKey: .satCriticalReadingAvgScore)
        satMathAvgScore = try values.decodeIfPresent(String.self, forKey: .satMathAvgScore)
        satWritingAvgScore = try values.decodeIfPresent(String.self, forKey: .satWritingAvgScore)
        schoolName = try values.decodeIfPresent(String.self, forKey: .schoolName)
    }
}
