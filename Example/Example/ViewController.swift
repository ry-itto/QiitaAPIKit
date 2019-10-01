//
//  ViewController.swift
//  Example
//
//  Created by 伊藤凌也 on 2019/09/30.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit
import QiitaAPIKit

protocol ViewProtocol: AnyObject {
    func reloadData()
    func showErrorMessage()
}

class ViewController: UIViewController, ViewProtocol {

    private(set) var presenter: ViewPresenter!

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = ViewPresenter(self)
    }

    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = ViewPresenter(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = presenter.items[indexPath.row]

        cell.textLabel?.text = item.title

        return cell
    }

    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func showErrorMessage() {
        let alert = UIAlertController(title: "Error", message: "any error occured", preferredStyle: .alert)
        present(alert, animated: true)
    }
}
