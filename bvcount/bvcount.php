<?php
/*
 * Plugin Name: bvcount
 * Description: Count the number of active plugins on your wordpress website
 * Version: 1.0.0
 */

function is_API_call() {
	return '1' == $_GET['api_call'];
}

function return_active_plugins() {
	$plugins = get_option('active_plugins');
	die (json_encode($plugins));
}
add_action('init', function() {
	if (is_API_call()) {
		return_active_plugins();
	}
});