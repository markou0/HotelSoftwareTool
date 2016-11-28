
<!-- Modals -->
<div class="modal fade" id="removeRec" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Delete Record Confirm</h4>
			</div>
			<div class="modal-body">
				<p>Are you sure you want delete this record?</p>
			</div>
			<div class="modal-footer">
				<form id="${tableName}RemoveForm" action="${tableName}/remove"
					method="post" class="form-horizontal">
					<input type="text" value="" class="hidden" name="id">
				</form>
				<input type="submit" value="Confirm" form="${tableName}RemoveForm"
					class="btn btn-danger" /> <input type="reset" value="Cancel"
					form="${tableName}RemoveForm" class="btn btn-default"
					data-dismiss="modal" />
			</div>
		</div>

	</div>
</div>

<div class="modal fade" id="editRec" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${tableName}</h4>
			</div>
			<div class="modal-body">

				<jsp:include page="${tableName}Form.jsp" flush="true" />
			</div>
		</div>

	</div>
</div>
<script>
	$(document)
			.ready(
					function() {
						
						$( 'select[name="roomTypeName"]').change(function(){
							$('select[name="roomCapacity"] option').remove();
					    });
						
						$( 'select[name="roomCapacity"]').change(function(){
							$('select[name="roomNumber"] option').remove();
					    });
						
						$( 'select[name="roomCapacity"]').change(function(){
							
					    });
						
						$( 'input[name="to"]').change(function(){
							$.ajax({
								url : 'checkBookingRoom',
								data : ({
									roomNumber: $('select[name="roomNumber"]').find(":selected").text() ,
									dateTo: $( 'input[name="to"]').val(),
									 dateFrom: $( 'input[name="from"]').val()
								}),
								success : function(data) {
									$('input[name="price"]').prop('value',data);
								}
							});
					    });
						
						$( 'select[name="roomCapacity"]').focus(function(){
							$.ajax({
								url : 'roomsByType',
								data : ({
									roomTypeName : $('select[name="roomTypeName"]').find(":selected").text()
								}),
								success : function(data) {
									$('select[name="roomCapacity"] option').remove();
									$('select[name="roomCapacity"]').html(data);
								}
							});
					    });
						
						$( 'select[name="roomNumber"]').focus(function(){
							$.ajax({
								url : 'roomsByCapacity',
								data : ({
									roomCapacity : $('select[name="roomCapacity"]').find(":selected").text()
								}),
								success : function(data) {
									$('select[name="roomNumber] option').remove();
									$('select[name="roomNumber"]').html(data);
								}
							});
							
							
					    });
						
						$(
								"button[data-target='#removeRec'],button[name='editRec']")
								.click(function() {
									$("tr").removeClass("info");
									$(this).parents("tr").addClass("info");
								});

						$("button[name='editRec']")
								.click(
										function() {
											$("#editRec form").attr('action',
													'${tableName}/edit');
											var col_names = $(this)
													.parents("tr")
													.children("td")
													.each(
															function() {
																$(
																		"input[name='"
																				+ $(
																						this)
																						.attr(
																								"name")
																				+ "']")
																		.prop(
																				'value',
																				$(
																						this)
																						.html());
																$(
																		"textarea[name='"
																				+ $(
																						this)
																						.attr(
																								"name")
																				+ "']")
																		.html(
																				$(
																						this)
																						.html());
																$("option")
																		.removeProp(
																				"selected");
																$(
																		"option[value='"
																				+ $(
																						this)
																						.html()
																				+ "']")
																		.prop(
																				'selected',
																				true);
																$(
																		"#editRec h4.modal-title")
																		.html(
																				"Edit ${tableName}");
															});

										});

						$("[data-dismiss='modal']").click(function() {
							$("tr").removeClass("info");
						});

						$("#createRec").click(
								function() {
									$("#editRec form").attr('action',
											'${tableName}/create');
									$("#editRec button[type='Reset']").click();
									$("#editRec h4.modal-title").html(
											"Create ${tableName}");
								});

						$("button[name='removeRec']")
								.click(

										function() {
											$("#editRec form").attr('action',
													'${tableName}/edit');
											var col_names = $(this)
													.parents("tr")
													.children("td")
													.each(
															function() {
																$(
																		"input[name='"
																				+ $(
																						this)
																						.attr(
																								"name")
																				+ "']")
																		.prop(
																				'value',
																				$(
																						this)
																						.html());
															});

										})

					});
</script>