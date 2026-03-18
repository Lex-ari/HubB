module ProjectCore {
    include "../lib/Interfaces/HubInterface.fpp"

    instance AtoBDriver: Drv.TcpClient base id 0x0100 \
    {
        phase Fpp.ToCpp.Phases.configComponents """
        ProjectCore::AtoBDriver.configure("127.0.0.1", 5020);
        """

        phase Fpp.ToCpp.Phases.startTasks """
        ProjectCore::AtoBDriver.start(Os::TaskString("AtoBTCP"), 30, Default::STACK_SIZE);
        """

        phase Fpp.ToCpp.Phases.stopTasks """
        ProjectCore::AtoBDriver.stop();
        (void)ProjectCore::AtoBDriver.join();
        """
    }
    instance AtoBAdapter: Drv.ByteStreamBufferAdapter base id 0x0200    


    instance AtoBHub: Svc.GenericHub base id ProjectCoreConfig.BASE_ID + 0x0800

    instance pingA: Components.Ping base id ProjectCoreConfig.BASE_ID + 0x0900

    @ My Subtopology Description
    topology ProjectCore {
        instance AtoBDriver
        instance AtoBAdapter

        instance AtoBHub
        instance pingA

        connections HubSend {
            AtoBHub.toBufferDriver -> AtoBAdapter.bufferIn
            AtoBAdapter.bufferInReturn -> AtoBHub.toBufferDriverReturn

            AtoBAdapter.toByteStreamDriver -> AtoBDriver.$send
            AtoBDriver.ready -> AtoBAdapter.byteStreamDriverReady
        }

        connections HubRecv {
            AtoBAdapter.bufferOut -> AtoBHub.fromBufferDriver
            AtoBHub.fromBufferDriverReturn -> AtoBAdapter.bufferOutReturn

            AtoBDriver.$recv -> AtoBAdapter.fromByteStreamDriver
            AtoBAdapter.fromByteStreamDriverReturn -> AtoBDriver.recvReturnIn
        }

        connections HubBConnections {
            # AtoBHub.tlmOut -> CdhCore.tlmSend.TlmRecv
            # AtoBHub.eventOut -> CdhCore.events.LogRecv

            pingA.ping -> AtoBHub.serialIn[HubPorts.PingSend]
            AtoBHub.serialOut[HubPorts.PingSend] -> pingA.pong
        }

    } # end topology
} # end ProjectCore