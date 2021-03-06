//
//  ChatViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 18/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//
import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatSwitch: UISegmentedControl!
    @IBOutlet weak var chatTableView: UITableView!
    
    var peopleToChat:[PersonToChat]=[]
    var peopleToChat2:[PersonToChat]=[]
    lazy var masterArrayDisplay = peopleToChat
    
    var switchSelectorInteger = 0
    
    override func viewDidLoad() {
        peopleToChat = createPeopleToChatArray()
        peopleToChat2 = createPeopleToChatArray2()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        navigationController!.popViewController(animated: true)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func createPeopleToChatArray()->[PersonToChat]{
        var tempArray:[PersonToChat]=[]
        tempArray.append(PersonToChat(name: "John", image:#imageLiteral(resourceName: "ss-uipickerview-card")))
        tempArray.append(PersonToChat(name: "Jafar", image:#imageLiteral(resourceName: "dev-setup")))
        tempArray.append(PersonToChat(name: "James", image:#imageLiteral(resourceName: "beginner-first-app")))
        
        return tempArray
    }
    
    func createPeopleToChatArray2()->[PersonToChat]{
        var tempArray:[PersonToChat]=[]
        tempArray.append(PersonToChat(name: "Amin", image:#imageLiteral(resourceName: "int-overview")))
        tempArray.append(PersonToChat(name: "Agus", image:#imageLiteral(resourceName: "dev-setup")))
        
        return tempArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ChatDetailViewController
        vc.chatPerson = sender as? PersonToChat
        vc.hidesBottomBarWhenPushed = true
    }
    
    
    @IBAction func chatSwitchTapped(_ sender: Any) {
        switchSelectorInteger = chatSwitch.selectedSegmentIndex
        
        switch switchSelectorInteger {
        case 0:
            masterArrayDisplay = peopleToChat
        case 1:
            masterArrayDisplay = peopleToChat2
        default:
            masterArrayDisplay=peopleToChat+peopleToChat2
            
        }
        
        chatTableView.reloadData()
    }
}

extension ChatViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterArrayDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = masterArrayDisplay[indexPath.row]
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatCell") as!ChatTableViewCell
        
        cell.createChatTableCell(person: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personToChat=masterArrayDisplay[indexPath.row]
        performSegue(withIdentifier: "MasterToDetailsChat", sender: personToChat)
    }
    
}

