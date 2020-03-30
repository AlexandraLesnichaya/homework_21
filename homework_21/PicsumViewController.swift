//
//  ViewController.swift
//  homework_21
//
//  Created by Александра Лесничая on 3/26/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import SDWebImage

class PicsumViewController: UIViewController {

    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var grayscaleSwitch: UISwitch!
    @IBOutlet weak var blurSwitch: UISwitch!
    @IBOutlet weak var bluringSlider: UISlider!
    @IBOutlet weak var bluringDegreeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadRandomImage()
    }

    func loadRandomImage() {
        let url = URL(string: "https://picsum.photos/300/300")
        randomImageView?.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
    }

    @IBAction func bluringSliderDidChange(_ sender: Any) {
        let blur = Int(bluringSlider.value)
        bluringDegreeLabel.text = String(blur)
    }

    @IBAction func refreshButtonDidClick(_ sender: Any) {
        let blur = Int(bluringSlider.value)

        randomImageView.setNeedsDisplay()

        if grayscaleSwitch.isOn && blurSwitch.isOn == false {
            let url = URL(string: "https://picsum.photos/300/300?grayscale")
            randomImageView?.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        } else if grayscaleSwitch.isOn == false && blurSwitch.isOn {
            let url = URL(string: "https://picsum.photos/300/300?blur=\(blur)")
            randomImageView?.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        } else if grayscaleSwitch.isOn && blurSwitch.isOn {
            let url = URL(string: "https://picsum.photos/300/300?grayscale&blur=\(blur)")
            randomImageView?.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        } else {
            let url = URL(string: "https://picsum.photos/300/300")
            randomImageView?.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        }
    }
}

