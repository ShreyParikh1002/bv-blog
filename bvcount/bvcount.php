<?php
/*
 * Plugin Name: bvcount
 * Description: Count the number of active plugins on your wordpress website
 * Version: 1.0.0
 */

function register_get_plugin_route(){
	register_rest_route('bvcount/v2','/count', array(
		'methods' => 'GET',
		'callback' => 'return_active_plugins'
	));
}

function return_active_plugins() {
	$plugins = get_option('active_plugins');
	return $plugins;
}

add_action('rest_api_init', 'register_get_plugin_route');