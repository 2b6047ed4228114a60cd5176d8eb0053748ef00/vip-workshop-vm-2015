<?php

add_action( 'init', function() {
	if ( isset( $_POST['pbe_location'] ) ) {
		$location = $_POST['pbe_location'];
		if ( ! pbe_is_valid_location( $location ) ) {
			$location = pbe_get_default_location();
		}
		pbe_set_user_location( $location );
		return;
	}

	if ( isset( $_COOKIE['pbe_user_location'] ) ) {
		pbe_set_user_location( $_COOKIE['pbe_user_location'] );
		return;
	}

	$location = pbe_fetch_location();
	pbe_set_user_location( $location );

} );

function pbe_get_locations() {
	return array( 'National', 'North', 'South' );
}

function pbe_is_valid_location( $location ) {
	return in_array( $location, pbe_get_locations() );
}

function pbe_get_default_location() {
	return pbe_get_locations()[0];
}

function pbe_has_user_location() {
	return isset( $GLOBALS['pbe_user_location'] );
}

function pbe_get_user_location() {
	if ( pbe_has_user_location() ) {
		return $GLOBALS['pbe_user_location'];
	}

	return pbe_get_default_location();
}

function pbe_set_user_location( $location ) {
	$GLOBALS['pbe_user_location'] = $location;
	$expiry = time() + ( DAY_IN_SECONDS * 14 );
	setcookie( 'pbe_user_location', $location, $expiry, COOKIEPATH, COOKIE_DOMAIN );
}

function pbe_fetch_location() {
	$response = wp_remote_get( home_url( '/geo-ip-api.php' ) );
	$body = json_decode( wp_remote_retrieve_body( $response ) );
	return $body->location;
}

function pbe_get_weather_for_user_location() {
	$location = pbe_get_user_location();
	$data = get_option( 'pbe_weather_' . $location );

	if ( ! empty( $data ) ) {
		if ( time() - $data['update_time'] < MINUTE_IN_SECONDS * 1 ) {
			return $data;
		}
	}

	$data = pbe_fetch_weather_for_location( $location );
	pbe_save_weather_for_location( $location, $data );
	return $data;
}

function pbe_fetch_weather_for_location( $location ) {
	$response = wp_remote_get( home_url( '/geo-weather-api.php?location=' . rawurlencode( $location ) ) );
	if ( is_wp_error( $response ) ) {
		return false;
	}

	$data = (array) json_decode( wp_remote_retrieve_body( $response ) );
	return $data;
}

function pbe_save_weather_for_location( $location, $data ) {
	update_option( 'pbe_weather_' . $location, $data );
}
