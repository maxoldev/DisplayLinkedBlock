//
//  DisplayLinkedBlock
//
//  Created by Max Sol on 08/20/2023.
//

import UIKit
import DisplayLinkedBlock

class ViewController: UIViewController {

    private var displayLink: DisplayLinkedBlock?

    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        var angle = 0.0
        displayLink = DisplayLinkedBlock { [weak self] _ in
            angle += 0.05
            self?.button.transform = CGAffineTransform(rotationAngle: angle)
        }
    }

    @objc
    private func onButton() {
        displayLink?.isPaused.toggle()
    }

}

extension ViewController {

    private func setupUI() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.setTitle("START / STOP", for: .normal)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 200)
        ])

        button.addTarget(self, action: #selector(onButton), for: .primaryActionTriggered)
    }

}
