#ifndef PROJECTCORE_DEFS_HPP
#define PROJECTCORE_DEFS_HPP

namespace ProjectCore {
    struct ProjectCoreState {
        /* include any variables that are needed for 
        configuring/starting/tearing down the topology */
    };
    struct TopologyState {
        ProjectCoreState ProjectCore_state;
    };
}

#endif