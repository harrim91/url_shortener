$(document).ready(function() {
	$('#btn-copy-url').click(function() {
		$('#field-short-url').select();
		document.execCommand('copy');
		alert('URL copied to clipboard.')
	});
});