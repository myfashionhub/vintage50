var Item = function(id, element) {
	var that = this;
	this.id = id;
	this.element = element;

	this.changeStatus = function(action) {
		console.log(action)
		if (action === 'delete') {
			that.removeFromInventory();
		} else if (action === 'publish') {
			that.updateStatus(action);
		}
	};

	this.removeFromInventory = function() {
		$.ajax({
			url: '/products/'+that.id,
			type: 'DELETE',
			success: function(data) {
				console.log(data);
				that.element.remove();
			},
			error: function(data) {
				console.log(data);
			}
		});
	};

	this.updateStatus = function(status) {
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
