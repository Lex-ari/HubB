module Components {
    include "../../lib/Interfaces/HubInterface.fpp"
    @ Component for F Prime FSW framework.
    passive component Ping {
        
        sync command PING()

        event Pong() severity activity high format "Pong 🏓"
        
        sync input port pong: PingPong
        output port ping: PingPong
        
        telemetry numPing: U64
        telemetry numPong: U64

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Enables command handling
        import Fw.Command

        @ Enables event handling
        import Fw.Event

        @ Enables telemetry channels handling
        import Fw.Channel

        @ Port to return the value of a parameter
        param get port prmGetOut

        @Port to set the value of a parameter
        param set port prmSetOut

    }
}