//
//  CommentController.swift
//  TestProject
//
//  Created by Baudunov Rapkat on 10/29/20.
//

import UIKit

class CommentController:UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var data:PostModel?
    var commets: [CommentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.roundedButton()
        Server.shared.commentShow(postId: data!.id!.description, completion: commentCollect)
    }
    
    func commentCollect(info:[CommentModel]){
        for i in info{
            commets.append(i)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentModuleCell
        cell.nameCell.text = commets[indexPath.row].name
        cell.emailCell.text = commets[indexPath.row].email
        cell.commentCell.text = commets[indexPath.row].body
        
        return cell
    }
    
    @IBAction func addCommentAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Добавить новый комментарий", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Введите ваше имя"
            }
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Введите адрес почты"
            }
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Введите свой комментарий"
            }
        let saveAction = UIAlertAction(title: "Добавить", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let name = alertController.textFields![0].text
            let email = alertController.textFields![1].text
            let comment = alertController.textFields![2].text
            
            self.addComment(info: CommentModel.init(name: name!, email: email!, body: comment!))
        })
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertAction.Style.default, handler: {
                (action : UIAlertAction!) -> Void in })
        
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addComment(info:CommentModel){
        commets.append(info)
        tableView.reloadData()
    }
}
