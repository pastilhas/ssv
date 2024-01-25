module wsv

import encoding.utf8

const (
	space    = ` `
	newline  = `\n`
	d_quotes = `"`
	dash     = `-`
	slash    = `/`
	hash     = `#`
)

pub fn encode(table [][]?string) {
	mut res := []u8{}
	for row in table {
		for value in row {
			if mut val := value {
			} else {
			}
		}
	}
}

pub fn escape_string(val string) string {
	if val.len == 0 {
		return '""'
	}
	runes := val.runes()
	if val.len == 1 && runes[0] == wsv.dash {
		return '"-"'
	}
	mut res := runes.clone()
	mut contains_whitespace := false
	for i := 0; i < runes.len; i++ {
		r := runes[i]
		if r == wsv.space {
			contains_whitespace = true
			continue
		}
		if r == wsv.d_quotes {
			contains_whitespace = true
			res.insert(i, wsv.d_quotes)
			continue
		}
		if r == wsv.hash {
			contains_whitespace = true
			continue
		}
		if r == wsv.newline {
			contains_whitespace = true
			res.delete(i)
			res.insert(i, [wsv.d_quotes, wsv.slash, wsv.d_quotes])
			continue
		}
	}
	if contains_whitespace {
		res.insert(0, wsv.d_quotes)
		res.insert(res.len, wsv.d_quotes)
	}
	return res.string()
}
