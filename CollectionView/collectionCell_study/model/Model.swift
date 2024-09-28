//
//  Model.swift
//  collectionCell_study
//
//  Created by 진세진 on 2023/07/21.
//

import Foundation


struct Model{
    var title : String
    var image : String
}

#if DEBUG

extension Model{
    
    static var ModelData = [
        Model(title: "PARD", image: "pard"),
        Model(title: "iOS", image: "apple"),
        //이 부분 고쳐줘야 합니다!!
        Model(title: "bear", image: "bear"),
        Model(title: "flower", image: "flower"),
    ]
}
#endif
