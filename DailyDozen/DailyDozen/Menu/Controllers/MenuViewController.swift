//
//  MenuViewController.swift
//  DailyDozen
//
//  Created by Konstantin Khokhlov on 18.10.17.
//  Copyright © 2017 Nutritionfacts.org. All rights reserved.
//

import UIKit

// MARK: - UITableViewController
class MenuViewController: UITableViewController {

    // MARK: - Nested
    private struct Strings {
        static let menu = "Menu"
    }

    // MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "More"
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuItem = MenuItem(rawValue: indexPath.row) else { return }

        if let link = menuItem.link {
            UIApplication.shared
                .open(LinksService.shared.link(forMenu: link),
                      options: [:],
                      completionHandler: nil)
            dismiss(animated: false)
        } else if let controller = menuItem.controller {
            navigationController?.pushViewController(controller, animated: true)
        }
        tableView.selectRow(at: nil, animated: false, scrollPosition: .none)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        super.tableView(tableView, heightForHeaderInSection: section)

        return 0.1
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        super.tableView(tableView, heightForFooterInSection: section)

        return 0.1
    }
}
