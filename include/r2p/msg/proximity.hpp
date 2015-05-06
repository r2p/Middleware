#pragma once

#include "time.hpp"

namespace r2p {

class ProximityMsg: public Message {
public:
	uint16_t value[8];
}R2P_PACKED;

}
