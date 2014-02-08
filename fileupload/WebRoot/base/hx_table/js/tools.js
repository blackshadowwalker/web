function isNum(s) {
	var r, re;
	re = /\d*/i; // \d表示数字,*表示匹配多个数字
	r = s.match(re);
	return (r == s) ? true : false;
}

function StringBuffer()
{

	this._infos_ = new Array;

	if (typeof StringBuffer._initialized == "undefined") {

		StringBuffer.prototype.append = function(str) {

			// this._infos_.push(str);
			this._infos_[this._infos_.length] = str;

			return this;
		}

		StringBuffer.prototype.toString = function(separator) {

			separator = typeof(separator) == "undefined" ? "" : separator;

			return this._infos_.join(separator);
		}

		StringBuffer.prototype.size = function() {

			return this._infos_.length;
		}

		StringBuffer._initialized = true;
	}
}