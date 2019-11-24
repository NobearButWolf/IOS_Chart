//
//  ViewController.swift
//  ios-exam-4
//
//  Created by liushangwei on 2019/11/17.
//  Copyright © 2019 zhouhaijian. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITextFieldDelegate,UITableViewDelegate{
    
    
    @IBOutlet weak var tableinput1: UITextField!
    var data1 = [String]()
    var data2 = [String]()
    
    @IBOutlet weak var table1: UITableView!
    @IBOutlet weak var table2: UITableView!
    
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var show1: UILabel!
    
    @IBOutlet weak var show2: UILabel!
    @IBOutlet weak var input2: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //tableView.dataSource = data1
        
       // print(tableView.dataSource)
        if tableView == table1 {

            return data1.count
        }
        else if tableView == table2 {

            return data2.count
        }
        else{

            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if tableView == table1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YellowCell") as! TableViewCell
            cell.name1.text = "\(data1[indexPath.row])"
            return cell
        }
        else if tableView == table2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GreenCell")!
          
            cell.textLabel?.text = "\(data2[indexPath.row])"
            
            return cell
        }
        else{
             let cell = tableView.dequeueReusableCell(withIdentifier: "YellowCell") as! TableViewCell
            return cell
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data1.append("1")
        data1.append("2")
        data2.append("A")
        
        input1.delegate = self
        input2.delegate = self
        
        table1.dataSource = self
        table2.dataSource = self
        table1.delegate = self
        table2.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func addData1(_ sender: Any) {
        if tableinput1?.text != ""{
            
            if let name = input1.text {
                if name != "" {
                    data1.append(name)
                    table1.reloadData()
                }
            }
           
        }
        
    }
    
    @IBAction func addData2(_ sender: Any) {
        if input2?.text != ""{
                   
                   if let name = input2.text {
                       if name != "" {
                           data2.append(name)
                           table2.reloadData()
                       }
                   }
                  
        }
    }
    @IBAction func edit(_ sender: Any) {
        table1.setEditing(!table1.isEditing, animated: true)
        table2.setEditing(!table2.isEditing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexpath: IndexPath){
        
        if tableView == table1{
            let data = data1[indexpath.row]
            self.show1.text = "你选了表1的\(data)"
            
        }
        else if tableView == table2 {
            let data = data2[indexpath.row]
            self.show2.text = "你选了表2的\(data)"
        }
        else{
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if tableView == table1{
            if editingStyle == .delete {
                    data1.remove(at: indexPath.row)
                    table1.reloadData()
                    print("YES")
                }
                else{
                    print("NO")
                }
        }
        else{
            if editingStyle == .delete {
                    data2.remove(at: indexPath.row)
                    table2.reloadData()
                    print("YES")
                }
                else{
                    print("NO")
                }
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
}
