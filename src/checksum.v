module main

import encoding.binary
import arrays

pub fn checksum(bytes []u8) u16 {
	mut sum := u32(0)
	bytes_ := arrays.append(bytes, [u8(0x00)])
	for i := 0; i < bytes.len; i += 2 {
		val := binary.big_endian_u16_at(bytes_, i)
		sum += val
	}
	for sum >> 16 != 0 {
		sum = (sum & 0xffff) + (sum >> 16)
	}
	return u16(sum)
}
