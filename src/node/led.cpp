#include "ch.h"
#include "hal.h"

#include <r2p/common.hpp>
#include <r2p/Middleware.hpp>
#include <r2p/Node.hpp>
#include <r2p/Publisher.hpp>
#include <r2p/Subscriber.hpp>

#include <r2p/node/led.hpp>
#include <r2p/msg/led.hpp>

namespace r2p {

ledpub_conf default_ledpub_conf = { "led2", 2 };
ledsub_conf default_ledsub_conf = { "led2" };

/*
 * Led publisher node
 */
msg_t ledpub_node(void * arg) {
	ledpub_conf * conf = reinterpret_cast<ledpub_conf *>(arg);
	Node node("ledpub");
	Publisher<LedMsg> led_pub;
	uint8_t led;
	uint32_t toggle = 0;

	if (conf == NULL) conf = &default_ledpub_conf;

	led = conf->led;

	node.advertise(led_pub, conf->topic);

	for (;;) {
		LedMsg *msgp;
		if (led_pub.alloc(msgp)) {
			msgp->led = led;
			msgp->value = toggle;
			toggle ^= 1;
			if (!led_pub.publish(*msgp)) {
				R2P_ASSERT(false);
			}

		}

		chThdSleepMilliseconds(500); //TODO: Node::sleep()
	}
	return CH_SUCCESS;
}

/*
 * Led subscriber node
 */

bool callback(const LedMsg &msg) {

	palWritePad(LED_GPIO, LED_PIN, msg.value);

	return true;
}

msg_t ledsub_node(void * arg) {
	ledsub_conf * conf = reinterpret_cast<ledsub_conf *>(arg);
	Node node("ledsub");
	Subscriber<LedMsg, 5> sub(callback);

	if (conf == NULL) conf = &default_ledsub_conf;

	node.subscribe(sub, conf->topic);

	for (;;) {
		if (!node.spin(Time::ms(2000))) {
			palTogglePad(LED_GPIO, LED_PIN);
		}
	}
	return CH_SUCCESS;
}

} /* namespace r2p */

