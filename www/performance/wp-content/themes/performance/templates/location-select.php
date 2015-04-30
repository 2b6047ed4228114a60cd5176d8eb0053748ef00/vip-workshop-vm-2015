<aside id="pbe-location-select-widget" class="widget pbe-location-select-widget">
	<h2 class="widget-title">Your Location</h2>
	<form method="POST">
		<select name="pbe_location" style="width: 100%; margin-bottom: 4px;">
			<?php foreach ( pbe_get_locations() as $location ) : ?>
				<option <?php selected( pbe_get_user_location(), $location ); ?>><?php echo esc_html( $location ); ?></option>
			<?php endforeach; ?>
		</select>
		<input type="submit" class="button primary" value="Change" style="width: 100%;">
	</form>
</aside>
