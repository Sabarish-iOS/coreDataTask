//
//  savedViewController.swift
//  coreDataTask
//
//  Created by Byot on 18/01/22.
//

import UIKit
import CoreData

class savedViewController: UIViewController {
    @IBOutlet weak var stdNameTxt: UITextField!
    @IBOutlet weak var stdRollNoTxt: UITextField!
    @IBOutlet weak var stdDepTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveBtnAction(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate //CRUD
        let context = app.persistentContainer.viewContext //CRUD
        let newStudent = NSEntityDescription.insertNewObject(forEntityName: "StudentDetails", into: context) //Create
        newStudent.setValue(self.stdNameTxt.text!, forKey: "studentName")
        newStudent.setValue(self.stdRollNoTxt.text!, forKey: "studentRollNo")
        newStudent.setValue(self.stdDepTxt.text!, forKey: "studentDep")
        do {
            try context.save()
        } catch let err as NSError {
            print(err.localizedDescription)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
