//
//  ViewController.swift
//  app5_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 11/13/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var parkImage: UIImageView!
    @IBOutlet weak var parkName: UILabel!
    @IBOutlet weak var parkDesignation: UILabel!
    @IBOutlet weak var parkDescription: UILabel!
    
    //var img = Image.init(url: "https://www.nps.gov/common/uploads/structured_data/3C861078-1DD8-B71B-0B774A242EF6A706.jpg")
    //var arr = [img]
        
    //var park: Park = Park(name: "name", designation: "designation", images: [img], description: "description")
    var park: Park?
    var segueparks : [String : Any]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*parkName.text = park?.name
        parkDesignation.text = park?.designation
        parkDescription.text = park?.description
        parkDescription.sizeToFit()
        
        if (park?.images.count)! > 0 {
            let url = URL(string: (park?.images[0].url)!)!
            if let data = try? Data(contentsOf: url) {
                parkImage.image = UIImage(data: data)
            }
        }
         
        if (park?.images.count)! > 0 {
             let url = URL(string: (park?.images[0].url)!)!
             if let data = try? Data(contentsOf: url) {
                 parkImage.image = UIImage(data: data)
             }
         }*/
        
        parkName.text = segueparks?["name"] as? String
        parkDesignation.text = segueparks?["designation"] as? String
        parkDescription.text = segueparks?["description"] as? String
        parkDescription.sizeToFit()
        
        //if segueparks?["imageurl"] as? String != "" {
        //if let urlString = segueparks?["imageurl"] as? String {
            //let url = URL(string: (segueparks?["imageurl"] as? String)!)
        if let url: String = segueparks!["imageurl"] as? String {
            if let ddata = try? Data(contentsOf: URL(string: url)!) {
                parkImage.image = UIImage(data: ddata)
            }
        }
    }

}

