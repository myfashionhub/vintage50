$(document).ready(function() {
  $('.product .add').click(function(e) {  
  	var product_id = $(e.target).parent().find('.meta').attr('data-id');
  	var product = new Product(product_id);
  	product.addToCloset();
  });
});


var Product = function(id) {
	this.id = id;
	var that = this;

	this.addToCloset = function() {
		$.ajax({
			url: '/closet',
			type: 'POST',
			data: { product_id: that.id },
			success: function(data) {
				console.log(data, 'Product added to your closet.');
			},
			error: function(data) {
				console.log(data);
			}
		});
	};

	this.removeFromClose = function() {
		$.ajax({
			url: '/products/remove',
			type: 'POST',
			data: { product_id: that.id },
			success: function(data) {
				console.log(data, 'Product removed from your closet.');
			},
			error: function(data) {
				console.log(data);
			}
		});		
	}
}
