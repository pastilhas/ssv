module main

fn main() {
	a := checksum('abba'.bytes())
	b := checksum('baab'.bytes())
	println(a == b)
}
