//
//  BaseTableViewControllerExtensions.swift
//  JenkinsiOS
//
//  Created by Robert on 27.11.16.
//  Copyright © 2016 MobiLab Solutions. All rights reserved.
//

import UIKit

extension BaseTableViewController{
    
    enum EmptyTableViewReason: String{
        case noData = "There does not seem to be anything here"
        case loading = "Loading data..."
        case error = "An error occurred"
    }
    
    func emptyTableView(for reason: EmptyTableViewReason, customString: String? = nil){
        switch reason{
            case .noData, .error: emptyTableViewForNoData(text: customString ?? reason.rawValue)
            case .loading: emptyTableViewForLoading(text: customString ?? reason.rawValue)
        }
    }

    private func emptyTableViewForLoading(text: String){
        emptyTableViewText = text
        
        guard let image = UIImage(named: "Jenkins_Loader")
            else { return }
        
        emptyTableViewImages = [ image ]
        emptyTableViewImageViewIsForLoading = true
    }
    
    private func emptyTableViewForNoData(text: String){
        emptyTableViewText = text
        
        guard let image = UIImage(named: "sadFace")
            else { return }
        
        emptyTableViewImageViewIsForLoading = false
        emptyTableViewImages = [ image ]
    }
}
