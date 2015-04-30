<?php

define( 'LIVE_UPDATES_REQUEST_INTERVAL', 2000 ); // ms; how frequently the app should poll the server
// seconds; factor by which our "API" is going to slow down
define( 'LIVE_UPDATES_SLOWDOWN_MIN', 2 );
define( 'LIVE_UPDATES_SLOWDOWN_MAX', 10 );
define( 'LIVE_UPDATES_CACHE_TIME', 10 ); // seconds; this needs to be low so we see the effects

require( __DIR__ . '/includes/geo.php' );
require( __DIR__ . '/includes/misc.php' );
require( __DIR__ . '/includes/json.php' );

add_action( 'wp_enqueue_scripts', function() {
	wp_register_style( 'parent-style', get_template_directory_uri() . '/style.css' );
	wp_enqueue_style( 'child-style', get_stylesheet_uri(), array( 'parent-style' ) );
} );
