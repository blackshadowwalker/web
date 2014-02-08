/**
 * @version 1.1
 * @author ideawu@163.com
 * @link http://www.ideawu.net/
 * @class
 * ��ҳ�ؼ�, ʹ��ԭ����JavaScript�����д. ��дonclick����, ��ȡ��ҳ�¼�,
 * ��������������˷���AJAX����.
 *
 * @param {String} id: HTML�ڵ��id����ֵ, �ؼ�����ʾ�ڸýڵ���.
 * @returns {PagerView}: ���ط�ҳ�ؼ�ʵ��.
 *
 * @example
 * ### HTML:
 * &lt;div id="pager"&gt;&lt;/div&gt;
 *
 * ### JavaScript:
 * var pager = new PagerView('pager');
 * pager.index = 3; // ��ǰ�ǵ�3ҳ
 * pager.size = 16; // ÿҳ��ʾ16����¼
 * pager.itemCount = 100; // һ����100����¼
 *
 * pager.onclick = function(index){
 *	alert('click on page: ' + index);
 *	// display data...
 * };
 *
 * pager.render();
 * 
 */
var PagerView = function(id){
	var self = this;
	this.id = id;

	this._pageCount = 0; // ��ҳ��
	this._start = 1; // ��ʼҳ��
	this._end = 1; // ����ҳ��

	/**
	 * ��ǰ�ؼ�������HTML�ڵ�����.
	 * @type DOMElement
	 */
	this.container = null;
	/**
	 * ��ǰҳ��, ��1��ʼ
	 * @type int
	 */
	this.index = 1;
	/**
	 * ÿҳ��ʾ��¼��
	 * @type int
	 */
	this.size = 15;
	/**
	 * ��ʾ�ķ�ҳ��ť����
	 * @type int
	 */
	this.maxButtons = 9;
	/**
	 * ��¼����
	 * @type int
	 */
	this.itemCount = 0;

	/**
	 * �ؼ�ʹ������д������, ��ȡ��ҳ�¼�, ��������������˷���AJAX����.
	 * ���Ҫȡ�����η�ҳ�¼�, ��д�ص��������� false.
	 * @param {int} index: �������ҳ��.
	 * @returns {Boolean} ����false��ʾȡ�����η�ҳ�¼�.
	 * @event
	 */
	this.onclick = function(index){
		return true;
	};

	/**
	 * �ڲ�����.
	 */
	this._onclick = function(index){
		var old = self.index;

		self.index = index;
		if(self.onclick(index) !== false){
			self.render();
		}else{
			self.index = old;
		}
	};

	/**
	 * ����ʾ֮ǰ�������ҳ�������ֵ.
	 */
	this._calculate = function(){
		self._pageCount = parseInt(Math.ceil(self.itemCount / self.size));
		self.index = parseInt(self.index);
		if(self.index > self._pageCount){
			self.index = self._pageCount;
		}
		if(self.index < 1){
			self.index = 1;
		}

		self._start = Math.max(1, self.index - parseInt(self.maxButtons/2));
		self._end = Math.min(self._pageCount, self._start + self.maxButtons - 1);
		self._start = Math.max(1, self._end - self.maxButtons + 1);
	};

	/**
	 * ��ȡ��Ϊ����������������Ӧҳ������Ƭ��.
	 * @param {Array[Object]} rows
	 * @returns {Array[Object]}
	 */
	this.page = function(rows){
		self._calculate();

		var s_num = (self.index - 1) * self.size ;
		var e_num = self.index * self.size;

		return rows.slice(s_num, e_num);	
	};

	/**
	 * ��Ⱦ�ؼ�.
	 */
	this.render = function(){
		var div = document.getElementById(self.id);
		div.view = self;
		self.container = div;

		self._calculate();

		var str = '';
		str += '<div class="PagerView">\n';
		if(self._pageCount > 1){
			if(self.index != 1){
				str += '<a href="javascript://1"><span>|&lt;</span></a>';
				str += '<a href="javascript://' + (self.index-1) + '"><span>&lt;&lt;</span></a>';
			}else{
				str += '<span>|&lt;</span>';
				str += '<span>&lt;&lt;</span>';
			}
		}
		for(var i=self._start; i<=self._end; i++){
			if(i == this.index){
				str += '<span class="on">' + i + "</span>";
			}else{
				str += '<a href="javascript://' + i + '"><span>' + i + '</span></a>';
			}
		}
		if(self._pageCount > 1){
			if(self.index != self._pageCount){
				str += '<a href="javascript://' + (self.index+1) + '"><span>&gt;&gt;</span></a>';
				str += '<a href="javascript://' + self._pageCount + '"><span>&gt;|</span></a>';
			}else{
				str += '<span>&gt;&gt;</span>';
				str += '<span>&gt;|</span>';
			}
		}
		str += ' һ��' + self._pageCount + 'ҳ, ' + self.itemCount + '����¼ ';
		str += '</div><!-- /.pagerView -->\n';

		self.container.innerHTML = str;

		var a_list = self.container.getElementsByTagName('a');
		for(var i=0; i<a_list.length; i++){
			a_list[i].onclick = function(){
				var index = this.getAttribute('href');
				if(index != undefined && index != ''){
					index = parseInt(index.replace('javascript://', ''));
					self._onclick(index)
				}
				return false;
			};
		}
	};

}
