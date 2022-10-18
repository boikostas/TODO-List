//
//  AddTaskViewController.swift
//  TODO List
//
//  Created by Стас Бойко on 26.08.2022.
//

import UIKit

protocol AddTaskViewControllerDelegate {
    var tasks: TasksStack { get set }
    var tableView: UITableView! { get }
    
    func reloadData()
}

class AddTaskViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var parentVC: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonPressed(_ sender: Any) {
        
        guard let name = nameTextField.text else { return }
        guard let description = descriptionTextField.text else { return }
        
        parentVC?.tasks.addTask(Task(name: name, description: description))
        parentVC?.reloadData()
        
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
