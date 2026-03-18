#include "ProjectCoreSubtopologyConfig.hpp"

namespace ProjectCore {
namespace Allocation {
// This instance can be changed to use a different allocator in the ProjectCore Subtopology
Fw::MallocAllocator mallocatorInstance;
Fw::MemAllocator& memAllocator = mallocatorInstance;
}  // namespace Allocation
}  // namespace ProjectCore
