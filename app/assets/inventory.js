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
