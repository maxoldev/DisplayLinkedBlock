//
//  DisplayLinkedBlock
//
//  Created by Max Sol on 08/20/2023.
//

import UIKit

/// Block-based `CADisplayLink` observer, free from retain cycle problems
public final class DisplayLinkedBlock {
    
    private final class DisplayLinkTarget {
        private let block: (CADisplayLink) -> Void

        init(with block: @escaping (CADisplayLink) -> Void) {
            self.block = block
        }
        
        @objc func displayTick(displayLink: CADisplayLink) {
            block(displayLink)
        }
    }

    private let displayLink: CADisplayLink

    public init(_ block: @escaping (CADisplayLink) -> Void) {
        // DisplayLinkTarget instance will be retained by CADisplayLink
        displayLink = CADisplayLink(target: DisplayLinkTarget(with: block), selector: #selector(DisplayLinkTarget.displayTick))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
    }
    
    deinit {
        displayLink.invalidate()
    }

    public var isPaused: Bool {
        get { displayLink.isPaused }
        set { displayLink.isPaused = newValue }
    }
    
}
