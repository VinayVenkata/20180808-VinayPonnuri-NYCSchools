//
//  ViewController.swift
//  20180808-VinayPonnuri-NYCSchools
//
//  Created by Vinay Ponnuri on 08/08/18.
//  Copyright © 2018 Vinay Ponnuri. All rights reserved.
//

import UIKit

struct ViewControllerConstants {
    static let urlString = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
}

class ViewController: UIViewController {
    
    final let url = URL(string: ViewControllerConstants.urlString)
    
    var satScoreArray = [SATScoreModel]()
    @IBOutlet weak var schoolListTableView: UITableView!
    
    
    //MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYC Schools List"
        tableViewSetUp()
        getSchoolListDetailAPICall()
    }
    
    //MARK: - Private Methods
    
    private func tableViewSetUp(){
        schoolListTableView.register(UINib(nibName: "SchoolViewCell", bundle: nil), forCellReuseIdentifier: "SchoolViewCellID")
        
        schoolListTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func getSchoolListDetailAPICall() {
        guard let validUrl = url else { return }
        URLSession.shared.dataTask(with: validUrl) { data, response, error in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    self.satScoreArray = try decoder.decode([SATScoreModel].self, from: data)
                    DispatchQueue.main.async {
                        self.schoolListTableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
}

//MARK: - Extension
//MARK: - TableView Delegates and Protocols Methods

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return satScoreArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolViewCellID") as? SchoolViewCell else {return UITableViewCell() }
        if let schoolName = satScoreArray[indexPath.row].schoolName {
            cell.schoolTitleLabel.text =  schoolName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let schoolDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "SchoolDetailsViewControllerID") as? SchoolDetailsViewController {
            schoolDetailVC.schoolDetail = satScoreArray[indexPath.row]
            self.navigationController?.pushViewController(schoolDetailVC, animated: true)
        }
    }
}

