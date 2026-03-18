// ======================================================================
// \title  Ping.hpp
// \author lex
// \brief  hpp file for Ping component implementation class
// ======================================================================

#ifndef HubA_Ping_HPP
#define HubA_Ping_HPP

#include "Components/Ping/PingComponentAc.hpp"

namespace Components {

class Ping final : public PingComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct Ping object
    Ping(const char* const compName  //!< The component name
    );

    //! Destroy Ping object
    ~Ping();

  private:
    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for pong
    void pong_handler(FwIndexType portNum,  //!< The port number
                      U32 a
                      ) override;

  private:
    // ----------------------------------------------------------------------
    // Handler implementations for commands
    // ----------------------------------------------------------------------
    U64 m_numPing{0};
    U64 m_numPong{0};


    //! Handler implementation for command PING
    void PING_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                         U32 cmdSeq            //!< The command sequence number
                         ) override;
};

}  // namespace Components

#endif
