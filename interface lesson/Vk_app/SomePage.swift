//
//  SomePage.swift
//  Vk_app
//
//  Created by Mstan on 08.04.2021.
//

import UIKit

class SomePage: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}
