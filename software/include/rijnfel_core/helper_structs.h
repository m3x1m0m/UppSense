/*
 * helper_structs.h
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#ifndef APP_HELPER_STRUCTS_H_
#define APP_HELPER_STRUCTS_H_

namespace rijnfel {

struct sSizedArray {
	size_t size;
	union {
		uint32_t * u_array;
		int32_t * i_array;
		void * p_array;
	};
};

}

#endif /* APP_HELPER_STRUCTS_H_ */
