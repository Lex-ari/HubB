module ProjectCoreConfig {
    # Base ID for the ProjectCore Subtopology, all components are offsets from this base ID
    constant BASE_ID = 0x10800000
    
    # Queue sizes for active components
    module QueueSizes {
        # Add your component queue sizes here. For example:
        # constant myComponent = 10
    }
    
    # Stack sizes for active components
    module StackSizes {
        # Add your component stack sizes here. For example:
        # constant myComponent = 64 * 1024
    }

    # Priorities for active components
    module Priorities {
        # Add your component priorities here. For example:
        # constant myComponent = 23
    }

    # Additional configuration modules can be added here as needed
    # For example:
    # module BufferSizes {
    #     constant myBuffer = 1024
    # }

    module BuffMgr {
        constant frameAccumulatorSize  = 2048     
        constant commsBuffSize         = 2048      
        constant commsFileBuffSize     = 3000      
        constant commsBuffCount        = 20        
        constant commsFileBuffCount    = 30       
        constant commsBuffMgrId        = 200      
    }
}
