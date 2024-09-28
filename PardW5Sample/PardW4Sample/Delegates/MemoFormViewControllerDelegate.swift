// Created by byo.

import UIKit

protocol MemoFormViewControllerDelegate: AnyObject {
    func memoFormDidSubmit(_ memo: MemoModel)
}
