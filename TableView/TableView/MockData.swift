//
//  MockData.swift
//  TableView
//
//  Created by 김하람 on 2023/09/29.
//

import UIKit

struct MockData{
    var title: String
    var name: String
}

extension MockData{
    static var modeling = [
        [
            MockData(title: "flower1", name: "flower"),
            MockData(title: "flower2", name: "flower"),
            MockData(title: "flower3", name: "flower"),
            MockData(title: "flower4", name: "flower"),
        ],
        [
            MockData(title: "BbangBbang1", name: "Bbang"),
            MockData(title: "BbangBbang2", name: "Bbang"),
            MockData(title: "BbangBbang3", name: "Bbang"),
        ],
        [
            MockData(title: "flower1", name: "flower"),
            MockData(title: "flower2", name: "flower"),
            MockData(title: "flower3", name: "flower"),
            MockData(title: "flower4", name: "flower"),
        ],
        [
            MockData(title: "BbangBbang1", name: "Bbang"),
            MockData(title: "BbangBbang2", name: "Bbang"),
            MockData(title: "BbangBbang3", name: "Bbang"),
        ],
    ]
}
