//
//  Resources.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit
 

enum Resources {
    enum Colors {
        static var actiy = UIColor(hexString: "#437BFE")
        static var inaActiy = UIColor(hexString: "#929DA5")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var titleGray  = UIColor(hexString: "#545C77")
        static var backgroundViews = UIColor(hexString: "#FBF9F9")
        static var secondary = UIColor(hexString: "#F0F3FF")
        
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String? {
                switch tab {
                case .overview:
                    return "Overview"
                case .session:
                    return "Session"
                case .progress:
                    return "Progress"
                case .settings:
                    return "Settings"
                }
            }
            
            //или
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
            
        }
        
        enum NavBar {
            static var overview = "Today"
            static var session = "High Intensity Cardio"
            static var progress = "Workout Progress"
            static var settings = "Settings"
        }
        
        enum Session {
            static let navBarStart = "Start   "
            static let navBarPause = "Pause"
            static let navBarStop = "Stop"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
        }
        
        enum Overview {
            static var allWorcoutsButton = "All Workouts"
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview:
                    return UIImage(named: "overview")
                case .session:
                    return UIImage(named: "session")
                case .progress:
                    return UIImage(named: "progress")
                case .settings:
                    return UIImage(named: "settings")
                }
            }
            
            //
            static var overview = UIImage(named: "overview")
            static var session = UIImage(named: "session")
            static var progress = UIImage(named: "progress")
            static var settings = UIImage(named: "settings")
        }
        
        enum Common {
            static var downArrow = UIImage(named: "down_arrow")
            static var add = UIImage(named: "add_button")
        }
    }
    
    enum Founts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
