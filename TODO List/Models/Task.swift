//
//  Task.swift
//  TODO List
//
//  Created by Стас Бойко on 04.10.2022.
//

import Foundation

struct Task {
    //var number: Int
    var name: String
    var description: String
}

struct TasksStack {
    var tasks = [Task]()
    
    mutating func addTask(_ task: Task) {
        tasks.append(task)
    }
}
