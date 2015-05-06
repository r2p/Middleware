MW_CPPSRC = $(MW)/src/impl/ArrayQueue_.cpp \
	$(MW)/src/impl/SimplePool_.cpp \
	$(MW)/src/impl/StaticList_.cpp \
	$(MW)/src/impl/StaticQueue_.cpp \
	$(MW)/src/BasePublisher.cpp \
	$(MW)/src/BaseSubscriber.cpp \
	$(MW)/src/BaseSubscriberQueue.cpp \
	$(MW)/src/BootMsg.cpp \
	$(MW)/src/Checksummer.cpp \
	$(MW)/src/LocalPublisher.cpp \
	$(MW)/src/LocalSubscriber.cpp \
	$(MW)/src/MessagePtrQueue.cpp \
	$(MW)/src/Message.cpp \
	$(MW)/src/Middleware.cpp \
	$(MW)/src/Node.cpp \
	$(MW)/src/RemotePublisher.cpp \
	$(MW)/src/RemoteSubscriber.cpp \
	$(MW)/src/Time.cpp \
	$(MW)/src/TimestampedMsgPtrQueue.cpp \
	$(MW)/src/Topic.cpp \
	$(MW)/src/Transport.cpp \
	$(MW)/src/Utils.cpp

ifeq ($(R2P_USE_BOOTLOADER),)
	R2P_USE_BOOTLOADER = no
endif

ifeq ($(R2P_USE_DEBUGTRANSPORT),)
	R2P_USE_DEBUGTRANSPORT = no
endif

ifeq ($(R2P_USE_RTCANTRANSPORT),)
	R2P_USE_RTCANTRANSPORT = no
endif

ifeq ($(R2P_USE_BOOTLOADER),yes)
MW_CPPSRC += $(MW)/src/Bootloader.cpp
endif

ifeq ($(R2P_USE_DEBUGTRANSPORT),yes)
MW_CPPSRC += $(MW)/src/transport/DebugTransport.cpp \
	$(MW)/src/transport/DebugPublisher.cpp \
	$(MW)/src/transport/DebugSubscriber.cpp
endif

ifeq ($(R2P_USE_RTCANTRANSPORT),yes)
MW_CPPSRC += $(MW)/src/transport/RTCANTransport.cpp \
	$(MW)/src/transport/RTCANPublisher.cpp \
	$(MW)/src/transport/RTCANSubscriber.cpp
endif

MW_INC = $(MW)/include
