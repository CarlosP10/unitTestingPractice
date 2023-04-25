//
//  TestHelpers.swift
//  TableViewTests
//
//  Created by Carlos Paredes on 25/4/23.
//

import UIKit

func numberOfRow(in tableView: UITableView, section: Int = 0) -> Int? {
    tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
}

func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
    tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
}

func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0){
    tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
}
