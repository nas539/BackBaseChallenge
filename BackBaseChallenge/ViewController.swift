//
//  ViewController.swift
//  BackBaseChallenge
//
//  Created by Nicholas Sharp on 6/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var jsonData: Cities?
  
  
  class ViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UIT}ableView!
    
    var cities: [cities] = [city]()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      tableView.dataSource = self as? UITableViewDataSource
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GoT")
      
      let url = Bundle.main.url(forResource: "cities", withExtension: "json")
      
      print(url!)
      
      let data = try? Data(contentsOf: url!)
      
      print(data!)
      
      jsonData = try? JSONDecoder().decode(Cities.self, from: data!)
      
      print(jsonData as Any)
      
      tableView.reloadData()
    }
    
  }
  
  
  fileprivate func fetchCities(completion: @escaping(Result<[Character], Error>) -> ()) {
    
    let url = Bundle.main.url(forResource: "Cities", withExtension: "json")
    
    let data = try? Data(contentsOf: url!)
    
    jsonData = try? JSONDecoder().decode(Cities.self, from: data!)
    
    
  }
  extension ViewController : UITableViewDelegate {
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
      SecondViewController.cities = self.episodesArray[indexPath.row].episodeTitle
      SecondViewController.premierDate = self.episodesArray[indexPath.row].premierDate
      SecondViewController.airtime = self.episodesArray[indexPath.row].airtime
      SecondViewController.season = String(self.episodesArray[indexPath.row].season)
      SecondViewController.episodeNumber = String(self.episodesArray[indexPath.row].episodeNumber)
      SecondViewController.summary = self.episodesArray[indexPath.row].summary
      navigationController?.pushViewController(SecondViewController, animated: true)
    }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.cellForRow(at: indexPath)?.isSelected = false
    }
  }
  
  extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return (jsonData == nil) ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: .default, reuseIdentifier: "City")
      
      cell.textLabel?.text = jsonData?.city
      
      return cell
    }

}

