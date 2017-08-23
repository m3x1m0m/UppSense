/*
 * data_provider.h
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#ifndef APP_DATA_PROVIDER_H_
#define APP_DATA_PROVIDER_H_

#include <vector>
#include <stddef.h>

#include "data_receiver.h"

namespace rijnfel {

class cDataProvider {
public:
	void Connect(cDataReceiver * i_receiver) {
		m_receivers.push_back(i_receiver);
	}
	void Push(void * i_data) {
		typedef std::vector<cDataReceiver*>::iterator Iterator;
		for (Iterator it = m_receivers.begin(), it_e = m_receivers.end(); it != it_e; ++it) {
			(*it)->Receive(i_data);
		}
	}
	~cDataProvider() {
		//
		//typedef std::vector<cDataReceiver>::iterator Iterator;
		//for (Iterator it = receivers.begin(), it_e = receivers.end(); it != it_e; ++it) {
		//	if ((*it) != NULL) {
		//		delete (*it);
		//	}
		//}
	}
private:
	std::vector<cDataReceiver*> m_receivers;
};

}

#endif /* APP_DATA_PROVIDER_H_ */
