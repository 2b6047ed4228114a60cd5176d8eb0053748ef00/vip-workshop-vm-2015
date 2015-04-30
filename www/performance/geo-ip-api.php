<?php

// If you want to simulate an unpredictable API, uncomment below.
//sleep( rand( 0, 8 ) );

// If you want to make the API really slow, uncomment below.
//sleep( 120 );

// If you want to kill the API, uncomment below.
//http_response_code( 500 ); die();

// Hard-code the location for simplicity; normally we'd
echo '{ "location": "North" }';
