$(document).ready(function() {
  $('.product .add').click(function(e) {  
  	var product_id = $(e.target).parent().find('.meta').attr('data-id');
  	var product = new Product(product_id);
  	product.addToCloset();
  });

  $('.product .remove').click(function(e) { 
    var item = $(e.target).parent();
    item.remove(); 
  	var product_id = item.find('.meta').attr('data-id');
  	var product = new Product(product_id);
  	product.removeFromCloset();
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
	}
}
