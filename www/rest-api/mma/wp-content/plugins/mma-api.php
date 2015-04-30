<?php
/*
Plugin Name: MMA API
Plugin URI: http://automattic.com
Description: Extends the WP-API to expose details from the MMA Database plugin.
Version: 1.0
Author: Beau Lebens
Author URI: http://automattic.com
*/

// See mma-db.php for how CPT and taxonomies are exposed in the API

class MMA_API {
	function __construct() {
		add_filter( 'json_prepare_user', array( $this, 'prepare_user' ), 10, 3 );
	}

	function prepare_user( $fields, $user, $request ) {
		$fields['height']     = get_user_meta( $user->ID, 'height', true );
		$fields['weight']     = get_user_meta( $user->ID, 'weight', true );
		$fields['stage_name'] = get_user_meta( $user->ID, 'stage_name', true );

		return $fields;
	}
}

new MMA_API();
