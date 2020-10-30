//
//  ViewController.swift
//  TestProject
//
//  Created by Baudunov Rapkat on 10/29/20.
//

import UIKit

class PostController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var posts : [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Server.shared.postShow(completion: postCollect)
    }
    
    func postCollect(info:[PostModel]){
//        for i in info{
//            posts.append(i)
//            tableView.reloadData()
//        }
        var i = 0
        while i < 20 {
            posts.append(info[i])
            i += 1
            tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = posts[indexPath.row]
        performSegue(withIdentifier: "dataSender", sender: data)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataSender" {
            let destVC = segue.destination as! CommentController
            destVC.data = (sender as! PostModel)
        }
    }

}

