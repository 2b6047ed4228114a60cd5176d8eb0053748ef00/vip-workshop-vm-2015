<?php

if ( false !== strpos( $_SERVER['REQUEST_URI'], '/fetch.json' ) ) {
	$start_time = microtime( true );
	$request_number = isset( $_GET['i'] ) ? intval( $_GET['i'] ) : 0;

	$data = wp_cache_get( 'live_updates', 'results' );

	if ( false === $data ) {
		$cache_miss = true;
		$data = pbe_fetch_latest_results();
		wp_cache_set( 'live_updates', $data, 'results', LIVE_UPDATES_CACHE_TIME );
	} else {
		$cache_miss = false;
	}

	$elapsed_time = microtime( true ) - $start_time;

	echo wp_json_encode( array(
		'data' => $data,
		'meta' => array(
			'cache_miss' => $cache_miss,
			'query_time' => $elapsed_time,
			'request_number' => $request_number,
		)
	) );
	exit;
}
