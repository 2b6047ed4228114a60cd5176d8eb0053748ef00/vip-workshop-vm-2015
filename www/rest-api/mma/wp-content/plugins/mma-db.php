<?php
/*
Plugin Name: MMA Database
Plugin URI: http://automattic.com
Description: Creates the data structures required to track some simple MMA details in a WordPress install.
Version: 1.0
Author: Beau Lebens
Author URI: http://automattic.com
*/

class MMA_DB {
	function __construct() {
		add_action( 'init', array( $this, 'register_fight_cpt' ) );
		add_action( 'init', array( $this, 'register_fight_tax' ) );
		$this->register_fighter_properties();
	}

	function register_fight_cpt() {
		register_post_type(
			'fight',
			array(
				'public' => true,
				'label'  => 'Fights',
				'show_in_rest' => true // Required to expose via the REST API
			)
		);
	}

	function register_fight_tax() {
		register_taxonomy(
			'fighters',
			'fight',
			array(
				'label' => __( 'Fighters' ),
				'show_ui' => false, // Don't show default UI, we'll make our own
				'show_in_rest' => true // Required to expose via the REST API
			)
		);

		if ( is_admin() ) {
			add_action( 'admin_menu', function() {
				add_meta_box(
					'fighter_selection_box',
					__( 'Fighters' ),
					array( $this, 'custom_fighter_selection' ),
					'fight',
					'normal',
					'core'
				);
			} );

			add_action( 'save_post', array( $this, 'custom_fighter_handler' ) );
		}
	}

	function custom_fighter_selection( $post ) {
		echo $this->fighter_dropdown( 0, $post );
		echo ' <em>' . esc_html( __( 'vs' ) ) . '</em> ';
		echo $this->fighter_dropdown( 1, $post );
	}

	/**
	 * This is a horrible, inefficient function.
	 */
	function fighter_dropdown( $num, $post ) {
		// If there are saved fighters for this post, we need to set SELECTED below
		$current = wp_get_object_terms( $post->ID, 'fighters' );

		$users = get_users();

		$str = '<select name="fighter-' . (int) $num . '">';

		foreach ( $users as $user ) {
			$stage_name = get_user_meta( $user->ID, 'stage_name', true );
			if ( empty( $stage_name ) ) {
				continue; // skip users without a stage name
			}

			// Maybe mark as selected. Because of how we're doing this, the order
			// won't necessarily be maintained, but it doesn't matter in this case.
			$selected = ( isset( $current[ $num ] ) && $current[ $num ]->name == $user->ID ) ? ' selected' : '';

			$str .= '<option value="' . $user->ID . '"' . $selected . '>' . esc_html( $stage_name ) . '</option>';
		}

		$str .= '</select>';

		return $str;
	}

	function custom_fighter_handler( $post_id ) {
		if ( isset( $_POST['fighter-0'] ) && isset( $_POST['fighter-1'] ) ) {
			wp_set_object_terms( $post_id, array( $_POST['fighter-0'], $_POST['fighter-1'] ), 'fighters' );
		}
	}

	/**
	 * Wires up the functions needed to handle the basic fighter properties.
	 */
	function register_fighter_properties() {
		// Handler for processing form submissions
		add_action( 'personal_options_update', array( $this, 'fighter_properties_handler' ) );
		add_action( 'edit_user_profile_update', array( $this, 'fighter_properties_handler' ) );

		// Render UI
		add_action( 'show_user_profile', array( $this, 'fighter_properties_ui' ) );
		add_action( 'edit_user_profile', array( $this, 'fighter_properties_ui' ) );
	}

	/**
	 * This is super basic -- you probably should not do this in production.
	 */
	function fighter_properties_handler( $user ) {
		if ( isset( $_POST['submit'] ) ) {
			update_user_meta( $user, 'height', preg_replace( '/[^\d\'"]/', '', $_POST['height'] ) );
			update_user_meta( $user, 'weight', preg_replace( '/[^\d]/', '', $_POST['weight'] ) );
			update_user_meta( $user, 'stage_name', preg_replace( '/[^a-z\d \'"]/i', '', $_POST['stage_name'] ) );
		}
	}

	function fighter_properties_ui( $user ) {
		?>
		<h3><?php _e( 'Fighter Details' ); ?></h3>
		<table class="form-table">
			<tbody>
				<tr>
					<th>
						<label for=""><?php _e( 'Height' ); ?></label>
					</th>
					<td>
						<input class="regular-text" type="text" name="height" value="<?php echo esc_attr( get_user_meta( $user->ID, 'height', true ) ); ?>" />
						<p class="description"><?php _e( 'In feet and inches' ); ?></p>
					</td>
				</tr>
				<tr>
					<th>
						<label for=""><?php _e( 'Weight' ); ?></label>
					</th>
					<td>
						<input class="regular-text" type="text" name="weight" value="<?php echo esc_attr( get_user_meta( $user->ID, 'weight', true ) ); ?>" />
						<p class="description"><?php _e( 'In pounds' ); ?></p>
					</td>
				</tr>
				<tr>
					<th>
						<label for=""><?php _e( 'Stage Name' ); ?></label>
					</th>
					<td>
						<input class="regular-text" type="text" name="stage_name" value="<?php echo esc_attr( get_user_meta( $user->ID, 'stage_name', true ) ); ?>" />
						<p class="description"><?php _e( 'What name does this person fight under?' ); ?></p>
					</td>
				</tr>
			</tbody>
		</table>
		<?php
	}
}

new MMA_DB();
