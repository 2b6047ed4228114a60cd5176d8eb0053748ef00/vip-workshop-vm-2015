<?php

// If you want to simulate an unpredictable API, uncomment below.
//sleep( rand( 0, 8 ) );

// If you want to make the API really slow, uncomment below.
//sleep( 120 );

// If you want to kill the API, uncomment below.
//http_response_code( 500 ); die();

// This would likely be doing some location specific stuff, but go for simplicity.

$weather = array(
	'<p>IT\'S RAINING Y\'ALL!<br /><img src="/performance/assets/rain.gif" /></p>',
	'<p>IT\'S SUNNY Y\'ALL!<br /><img src="/performance/assets/sun.png" /></p>',
	'<p>IT\'S SNOWING Y\'ALL!<br /><img src="/performance/assets/snow.gif" /></p>',
);

shuffle( $weather );

echo json_encode( array(
	'data' => $weather[0],
	'update_time' => time(),
) );
