//
//  SchoolDetailsViewController.swift
//  20180808-VinayPonnuri-NYCSchools
//
//  Created by Vinay Ponnuri on 08/08/18.
//  Copyright © 2018 Vinay Ponnuri. All rights reserved.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    var schoolDetail: SATScoreModel?
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var readingScore: UILabel!
    @IBOutlet weak var totalTestTakers: UILabel!
    
    
     //MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        self.title = "School Details"
    }
    
     //MARK: - Private  Methods
    private func updateUI()  {
        schoolName.text = schoolDetail?.schoolName ?? "N/A"
        totalTestTakers.text = schoolDetail?.numOfSatTestTakers ?? "N/A"
        writingScore.text = schoolDetail?.satWritingAvgScore ?? "N/A"
        mathScore.text = schoolDetail?.satMathAvgScore ?? "N/A"
        readingScore.text = schoolDetail?.satCriticalReadingAvgScore ?? "N/A"
    }

}
