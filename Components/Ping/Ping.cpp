// ======================================================================
// \title  Ping.cpp
// \author lex
// \brief  cpp file for Ping component implementation class
// ======================================================================

#include "Components/Ping/Ping.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

Ping ::Ping(const char* const compName) : PingComponentBase(compName) {}

Ping ::~Ping() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

void Ping ::pong_handler(FwIndexType portNum, U32 a) {
    this->m_numPong++;
    this->tlmWrite_numPong(this->m_numPing);
    this->log_ACTIVITY_HI_Pong();
}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

void Ping ::PING_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    this->m_numPing++;
    this->ping_out(0, 0);
    this->tlmWrite_numPing(this->m_numPing);   
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

}  // namespace Components
