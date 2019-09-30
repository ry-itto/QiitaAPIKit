//
//  ViewController.swift
//  Example
//
//  Created by 伊藤凌也 on 2019/09/30.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit
import QiitaAPIKit

class ViewController: UITableViewController {

    var items: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = items[indexPath.row].body
    }
}
