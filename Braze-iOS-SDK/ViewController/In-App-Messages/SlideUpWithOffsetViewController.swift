//
//  SlideUpWithOffsetViewController.swift
//
//  Created by Martijn van de Bovenkamp on 10/03/2022.
//

import UIKit
import AppboyUI


class SlideUpWithOffsetViewController: ABKInAppMessageSlideupViewController {
    
//INSERT OFFSET CUSTOMISATION HERE
    override var offset: CGFloat {
        get {
          return super.offset
        }
        set {
          super.offset = newValue + adjustedOffset
        }
        }
        
        func setOffset() {
            offset = 10
        }
    
    // When subclassing ABKInAppMessageSlideupViewController, we have to manually handle orienation changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransition(to: size, with: coordinator)
      coordinator.animate(alongsideTransition: { context in
        self.setOffset()
      }, completion: nil)
  }

}

class CustomInAppMessage: ABKInAppMessage {
    //do nothing
    override var message: String {
        get {
            return super.message
        }
        set {
            print(newValue)
            super.message = newValue + " we add this"
        }
    }
}

// MARK: - ABKUIUtils
extension SlideUpWithOffsetViewController {
  var activeApplicationViewController: UIViewController {
    return ABKUIUtils.activeApplicationViewController
  }
}

// MARK: - Bottom Spacing Variables
private extension SlideUpWithOffsetViewController {
  var rootViewBottomSpacing: CGFloat {
      return self.activeApplicationViewController.view.safeAreaInsets.bottom
  }
  
  var topMostViewBottomSpacing: CGFloat {
      return self.activeApplicationViewController.topMostViewController().view.safeAreaInsets.bottom + 10
  }
    
  /// Calculating the net `safeAreaInsets.bottom` value from the top most view controller and the root view controller in order to position the `SlideFromBottomViewController` above the tab bar (if present).
  var bottomSpacing: CGFloat {
    return  topMostViewBottomSpacing - rootViewBottomSpacing + 10
  }
  
  /// See the `safeAreaOffset` value from the `ABKInAppMessageSlideupViewController.m` file.
  ///
  /// On devices such as the iPhone SE, we only want to negate the `DefaultVerticalMarginHeight` if there is no bottom tab bar.
  var safeAreaOffset: CGFloat {
    guard view.superview?.layoutMargins.bottom == 0, bottomSpacing != 0 else { return 0 }
    
    return brazeDefaultVerticalMarginHeight
  }
  
  /// See the `DefaultVerticalMarginHeight` value from the `ABKInAppMessageSlideupViewController.m` file.
  var brazeDefaultVerticalMarginHeight: CGFloat {
    return 10
  }
  
  /// Used in the `offset` setter value to set the correct value when presented on screen and when dragged. (see `inAppSlideupWasPanned` in `ABKInAppMessageWindowController.m`)
  var adjustedOffset: CGFloat {
    return -(bottomSpacing - safeAreaOffset)
  }
}

extension SlideUpWithOffsetViewController {
    //Override beforeMoveInAppMessageViewOnScreen and set custom offset variable
    override func beforeMoveInAppMessageViewOnScreen() {
      super.beforeMoveInAppMessageViewOnScreen()
      setOffset()
    }


  }
    



