//
//  YMCollectionDetailController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let collectionTableCellID = "YMCollectionTableViewCell"

class YMCollectionDetailController: UIViewController {
    
    var type = String()
    
    var posts = [YMCollectionPost]()
    
    var id: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(describing: YMCollectionTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: collectionTableCellID)
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        if type == "专题合集" {
            UNNetworkTool.shareNetworkTool.loadCollectionPosts(id: id!) { [weak self] (posts) in
                self!.posts = posts
                self!.tableView.reloadData()
            }
        } else if type == "风格品类" {
            UNNetworkTool.shareNetworkTool.loadStylesOrCategoryInfo(id: id!, finished: { [weak self] (items) in
                self!.posts = items
                self!.tableView.reloadData()
            })
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMCollectionDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: collectionTableCellID) as! YMCollectionTableViewCell
        cell.selectionStyle = .none
        cell.collectionPost = posts[indexPath.row
        ]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let postDetailVC = YMPostDetailViewController()
//        postDetailVC.post = posts[indexPath.row]
//        postDetailVC.title = "攻略详情"
//        navigationController?.pushViewController(postDetailVC, animated: true)
        
    }
}
