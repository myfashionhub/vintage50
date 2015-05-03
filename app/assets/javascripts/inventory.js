$(document).ready(function() {
  $('.product .actions').on('change', function(e) {  
  	var action = e.target.value; 
  	var item = new Item($(e.target).parent()); 
  	item.changeStatus(action.toLowerCase());
  });

  var inventory = new Inventory();
});

var Item = function(element) {
	var that = this;
	this.element = element;
	this.id = element.find('.meta').attr('data-id');

	this.changeStatus = function(action) {
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

var Inventory = function() {
	this.container = $('.bulk-edit');
  this.selectAllButton = this.container.find('.select-all');
  this.deselectAllButton = this.container.find('.deselect-all');
  this.actions = this.container.find('.bulk-actions');

  this.init = function() {
  	this.selectAllButton.click(function() {
  		$('.product .checkbox').prop('checked', true);
  	});

  	this.deselectAllButton.click(function() {
  		$('.product .checkbox').prop('checked', false);
  	});
  };

  this.init();
}
