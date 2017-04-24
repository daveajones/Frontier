//
//  ManagedThread.swift
//  FrontierCore
//
//  Created by Brent Simmons on 4/23/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

class ManagedThread: Thread {
	
	var identifier = 0
	
	public override func main() {
		
		super.main()
		ThreadSupervisor.threadDidComplete(identifier: identifier)
	}
}
