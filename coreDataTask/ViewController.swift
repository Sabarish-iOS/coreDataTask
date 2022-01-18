//
//  ViewController.swift
//  coreDataTask
//
//  Created by Byot on 18/01/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var stdArray : NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    //ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        let app = UIApplication.shared.delegate as! AppDelegate //CRUD
        let context = app.persistentContainer.viewContext //CRUD
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentDetails")
        do {
            self.stdArray = try context.fetch(fetchRequest) as NSArray
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        } catch let err as NSError {
            print(err.localizedDescription)
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stdArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! customTableViewCell
        let stdObject = self.stdArray.object(at: indexPath.row) as! NSManagedObject //array to dict
        cell.stdNameLbl.text = "\(stdObject.value(forKey: "studentName")!)"
        cell.stdRollNoLbl.text = "\(stdObject.value(forKey: "studentRollNo")!)"
        cell.stdDepLbl.text = "\(stdObject.value(forKey: "studentDep")!)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

