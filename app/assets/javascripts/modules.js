var Modal = function(selector) {
  var that = this;
	this.element = $(selector);
	this.closeButton = this.element.find('.close');
	this.content = this.element.find('.content');

	this.init = function() {
		this.closeButton.click(that.close);
	};

	this.open = function() {
		this.element.addClass('active');
		$('.global-overlay').addClass('active');
	};

	this.close = function() {
		this.element.removeClass('active');
		$('.global-overlay').removeClass('active');
	};

	this.init();
}
