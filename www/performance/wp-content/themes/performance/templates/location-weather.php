<aside id="pbe-location-weather-widget" class="widget pbe-location-weather-widget">
	<h2 class="widget-title">Local Weather</h2>
	<?php $weather = pbe_get_weather_for_user_location(); ?>
	<?php if ( ! empty( $weather ) ) : ?>
		<?php echo $weather['data']; ?>
	<?php else : ?>
		<p>Weather data is currently not available.</p>
	<?php endif; ?>
</aside>
