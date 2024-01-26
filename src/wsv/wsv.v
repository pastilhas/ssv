module wsv

const (
	space    = ` `
	newline  = `\n`
	d_quotes = `"`
	dash     = `-`
	slash    = `/`
	hash     = `#`
)

pub fn encode(table [][]?string) []u8 {
	mut res := []u8{}
	for row in table {
		for value in row {
			if val := value {
				res << escape_string(val).bytes()
			} else {
				res << u8(wsv.dash)
			}
			res << u8(wsv.space)
		}
		res.delete_last()
		res << u8(wsv.newline)
	}
	return res
}

pub fn escape_string(val string) string {
	if val.len == 0 {
		return '""'
	}
	runes := val.runes()
	if runes.len == 1 && runes[0] == wsv.dash {
		return '"-"'
	}
	mut res := runes.clone()
	mut contains_whitespace := false
	mut j := 0
	for i := 0; i < runes.len; i++, j++ {
		r := runes[i]
		if r == wsv.space {
			contains_whitespace = true
			continue
		}
		if r == wsv.d_quotes {
			contains_whitespace = true
			res.insert(j, wsv.d_quotes)
			j++
			continue
		}
		if r == wsv.hash {
			contains_whitespace = true
			continue
		}
		if r == wsv.newline {
			contains_whitespace = true
			res.delete(j)
			res.insert(j, [wsv.d_quotes, wsv.slash, wsv.d_quotes])
			j++
			j++
			continue
		}
	}
	if contains_whitespace {
		res.insert(0, wsv.d_quotes)
		res.insert(res.len, wsv.d_quotes)
	}
	return res.string()
}
