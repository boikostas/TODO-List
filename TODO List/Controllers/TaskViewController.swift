//
//  ViewController.swift
//  TODO List
//
//  Created by Стас Бойко on 26.08.2022.
//

import UIKit

class TaskViewController: UIViewController, AddTaskViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var tasks = TasksStack()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(tasks.tasks)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddTaskViewController else { return }
        vc.parentVC = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TaskCellTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCellTableViewCell
        
        let task = tasks.tasks[indexPath.row]
        
        cell.taskNumberLabel.text = "Task #\(indexPath.row + 1)"
        cell.nameLabel.text = task.name
        cell.descriptionLabel.text = task.description

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        tasks.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
        print(tasks.tasks)
        
        
        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}



