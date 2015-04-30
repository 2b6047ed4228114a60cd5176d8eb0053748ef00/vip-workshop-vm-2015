<?php

function pbe_fetch_latest_results() {
	$sleep = rand( LIVE_UPDATES_SLOWDOWN_MIN, LIVE_UPDATES_SLOWDOWN_MAX );
	sleep( $sleep );

	$value1 = rand( 35, 75 );
	$value2 = 100 - $value1;

	return array(
		'icecream' => $value1,
		'gelato' => $value2,
	);
}
