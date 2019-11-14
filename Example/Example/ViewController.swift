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
    private(set) var auth: QiitaAPIKit.Auth!

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("login!!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = ViewPresenter(self)
        self.auth = QiitaAPIKit.Auth(clientID: "f584f9f45a56992f2552e4fe7f04640cc32066f0", clientSecret: "c5fe03dc7552781fec8eaf49eebfe8b520ece4e9", redirectURLString: "https://qiita.com/ry-itto", scope: [.readQiita])
    }

    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = ViewPresenter(self)
        self.auth = QiitaAPIKit.Auth(clientID: "f584f9f45a56992f2552e4fe7f04640cc32066f0", clientSecret: "c5fe03dc7552781fec8eaf49eebfe8b520ece4e9", redirectURLString: "https://qiita.com/ry-itto", scope: [.readQiita])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.dataSource = self

        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLoginButton))
        loginButton.addGestureRecognizer(tapGesture)

        auth.delegate = self
    }

    @objc func tapLoginButton() {
        auth.showLoginView()
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

extension ViewController: QiitaAPIKitAuthDelegate {
    func present(loginView: UIViewController) {
        present(loginView, animated: true)
    }

    func dismissLoginView() {
        dismiss(animated: true)
    }
}
