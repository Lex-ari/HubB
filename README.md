# HubB F' project
The GenericHub pattern enables port connections to span two physically separate F' deployments. Multiple connections are multiplexed through a single TCP connection.

This project consists of 3 repositories:
- [ADeployment](https://github.com/Lex-ari/HubA): A "primary" FSW
- [BDeployment](https://github.com/Lex-ari/HubB): A "secondary" FSW (ex. payload/sensor)
- [HubInterface](https://github.com/Lex-ari/HubInterfaces)


### BDeployment
- Main deployment topology
- Runs a TcpClient connecting to 127.0.0.1:5020
- Has pingB component instance

### The Hub
The GenericHub receives serializable port invocations / buffers and serializes it across a communications bridge. Likewise, a listening hub deserializes the passed messages and routes them to according channels. This also includes events and telemetry, when hooked up either manually or autocoded via magic ports.
```
    connections ADeployment {
      ProjectCore.AtoBHub.tlmOut -> CdhCore.tlmSend.TlmRecv
      ProjectCore.AtoBHub.eventOut -> CdhCore.events.LogRecv
    }
```

### The Ping Component

Components/Ping is a simple test component demonstrating cross-hub communication. It's identical in both HubA and HubB.
This component uses a shared port definition present in lib/HubInterfaces

When PING command is invoked: The port invocation is sent through hub to the other deployment's pong port, and the receiving side's Ping component increments numPong and logs "Pong 🏓" event.

In this implementation, telemetry and events are passed through the hub and is present on the ADeployment binary.
```
    connections BDeployment {
      ProjectCore.pingB.tlmOut -> ProjectCore.AtoBHub.tlmIn
      ProjectCore.pingB.logOut -> ProjectCore.AtoBHub.eventIn
    }
```

### HubInterfaces Shared Submodule

lib/HubInterfaces guarentees both deployments use identical port definitions and hub indexing

```
HubInterface.fpp:
enum HubPorts {
    PingSend = 0
}

port PingPong(a: U32)
```

- Both deployments include "../lib/HubInterfaces/HubInterface.fpp"
- Single source of truth for cross-hub port definitions and matches ports correctly across repositories

