//
//  SettingsAccordionTableViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 04/11/20.
//

import UIKit

class SettingsAccordionTableViewController: UITableViewController {
    
    var data: [AccordionItem] = []
    
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SettingsAccordionTableViewCell", bundle: nil), forCellReuseIdentifier: "accordionCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accordionCell", for: indexPath) as! SettingsAccordionTableViewCell
        
        let item = data[indexPath.section]
        cell.setupView(data: item, isActive: selectedIndexPath == indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let cell = tableView.cellForRow(at: indexPath) as? SettingsAccordionTableViewCell else { return indexPath }
        
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
            cell.setChevron(false)
        } else {
            selectedIndexPath = indexPath
            cell.setChevron(true)
            guard let previousCellIndexPath = tableView.indexPathForSelectedRow else { return indexPath }
            guard let previousCell = tableView.cellForRow(at: previousCellIndexPath) as? SettingsAccordionTableViewCell else { return indexPath }
            previousCell.setChevron(false)
        }
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndexPath == indexPath {
            return UITableView.automaticDimension
        } else {
            return 45
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .none
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
}
