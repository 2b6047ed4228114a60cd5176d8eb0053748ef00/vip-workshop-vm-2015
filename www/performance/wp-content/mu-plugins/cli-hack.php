<?php

// Hack to force generated posts into a category because `post generate` does not allow category
if ( defined( 'WP_CLI' ) && WP_CLI ) {
	add_action( 'wp_insert_post', 'pbe_force_location_category', 10, 3 );
}

function pbe_force_location_category( $post_ID, $post, $update ) {
	static $i;

	if ( ! isset( $i ) ) {
		$i = 0;
	}

	$locations = pbe_get_locations();
	$location_category = $locations[ $i ];

	wp_set_object_terms( $post_ID, $location_category, 'category', true );

	$i++;
	if ( $i >= count( $locations ) ) {
		$i = 0;
	}
}
