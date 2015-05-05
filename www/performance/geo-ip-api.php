<?php

// If you want to simulate an unpredictable API, uncomment below.
// For 1 in 2 requests, add a delay of 1 or 2s
/*
if ( rand( 0, 1 ) ) {
	sleep( rand( 1, 2 ) );
}
*/

// If you want to make the API really slow, uncomment below.
//sleep( 120 );

// If you want to kill the API, uncomment below.
/*
http_response_code( 500 );
die();
*/

// Hard-code the location for simplicity; normally we'd
echo '{ "location": "North" }';
