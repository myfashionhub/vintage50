$(document).ready(function() {
  $('.product .add').click(function(e) {  
  	var product = new Product($(e.target).parent());
  	product.addToCloset();
  });

  $('.product .remove').click(function(e) { 
    var item = $(e.target).parent();
  	var product = new Product(item);
  	product.removeFromCloset();
  	item.remove();
  });

  $('.product img').click(function(e) {
  	var product = new Product($(e.target).parent());
  	product.enlargedView();
  });

});


var Product = function(element) {
	this.element = element;
	this.id = this.element.find('.meta').attr('data-id');
	var that = this;

	this.addToCloset = function() {
		$.ajax({
			url: '/closet',
			type: 'POST',
			data: { product_id: that.id },
			success: function(data) {
				console.log(data);
			},
			error: function(data) {
				console.log(data);
			}
		});
	};

	this.removeFromCloset = function() {
		$.ajax({
			url: '/closet',
			type: 'DELETE',
			data: { product_id: that.id },
			success: function(data) {
				console.log(data);
			},
			error: function(data) {
				console.log(data);
			}
		});		
	};

	this.enlargedView = function() {
		var modal = new Modal('.modal');
		modal.content.html(that.element.clone());
		modal.open();
	};
}
