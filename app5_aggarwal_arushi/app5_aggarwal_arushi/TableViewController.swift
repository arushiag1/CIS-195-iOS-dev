//
//  TableViewController.swift
//  app5_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 11/18/20.
//

import UIKit
import Firebase
import FirebaseFirestore

class TableViewController: UITableViewController {
        
    var parks = [Park]()
    var segueparks : [String : Any]?
    let endpoint: String = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=d6lHhdBhEYhhjwQvQ88D1aY3Hk1i6CnicXrkmIXI"
    let db = Firestore.firestore()
    var docRef: DocumentReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        // Do any additional setup after loading the view.
    }

    private func makeAPICall() {
        let url = URL(string: endpoint)!
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error")
                return
            }
            if let APIResponse = try? JSONDecoder().decode(APIData.self, from: data) {
                self.parks = APIResponse.data
                DispatchQueue.main.async {
                    self.addToFirebase()
                    self.tableView.reloadData()
                }
                //print(self.parks)
            }
        }
        task.resume()
    }
    
    func addToFirebase() {
        for i in 0..<parks.count {
            let park = parks[i]
            var url: URL?
            if parks[i].images.count > 0 {
                url = URL(string: parks[i].images[0].url)!
            } else {
                url = nil
            }
            
            
            var data : [String: Any] = ["name": park.name, "designation": park.designation, "description": park.description]
            if (url != nil) {
                data["imageurl"] = "\(url!)"
            }
            
                    docRef = Firestore.firestore().collection("parks").document("\(i)")
                    docRef.setData(data, completion: { error in
                        if let _ = error {
                            print("Error writing document")
                        } else {
                            print("No error")
                        }
                    })
        }
                
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "park", for: indexPath)
        Firestore.firestore().collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
            
            if let data = docSnapshot?.data() {
                if let parkName = cell.viewWithTag(1) as? UILabel {
                    //parkName.text = parks[indexPath.row].name
                    parkName.text = data["name"] as? String
                }
                if let parkDesignation = cell.viewWithTag(2) as? UILabel {
                    //parkDesignation.text = parks[indexPath.row].designation
                    parkDesignation.text = data["designation"] as? String
                }
                if let parkImage = cell.viewWithTag(3) as? UIImageView {
                    /*if parks[indexPath.row].images.count > 0 {
                        let url = URL(string: parks[indexPath.row].images[0].url)!
                        if let data = try? Data(contentsOf: url) {
                            parkImage.image = UIImage(data: data)
                        }
                    }*/
                    if let url: String = data["imageurl"] as? String {
                        if let ddata = try? Data(contentsOf: URL(string: url)!) {
                            parkImage.image = UIImage(data: ddata)
                        }
                    
                    }
                    
                }
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Firestore.firestore().collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
            if let data = docSnapshot?.data() {
                self.segueparks = data
            }
        self.performSegue(withIdentifier: "toDetail", sender: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        let indexPath = sender as! IndexPath
        //vc.park = parks[indexPath.row]
        vc.segueparks = self.segueparks
    }
    
    func configureRefreshControl () {
       // Add the refresh control to your UIScrollView object.
       self.refreshControl = UIRefreshControl()
       self.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
        
    @objc func handleRefreshControl() {
       // Update your content…
        makeAPICall()
       // Dismiss the refresh control.
       DispatchQueue.main.async {
          self.refreshControl?.endRefreshing()
       }
    }

}

