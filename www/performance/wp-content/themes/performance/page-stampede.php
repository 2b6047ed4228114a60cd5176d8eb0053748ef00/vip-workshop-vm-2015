<?php
/**
 * Template Name: Stampede
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">
			<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

				<header class="entry-header">
					<h1 class="entry-title">Dessert Showdown</h1>
				</header>

				<div class="entry-content">
					<p class="intro">Which dessert is <a href="http://gelatissimo.com.au/wp-content/uploads/2015/03/Gelato-Vs-Ice-Cream-Poster.png" target="_blank">better</a>? This app displays "real-time" voting results fetched server-side from an <span title="if rand() was considered an external API...">"external API"</span>.</p>

					<p class="intro">The "API" is notoriously unreliable so we cache the results for <strong><?php echo intval( LIVE_UPDATES_CACHE_TIME ); ?></strong> seconds. (We also cache it because we're good developers :))</p>

					<p class="intro">Hit "start" below to begin fetching updates.</p>

					<button id="start-fetching">Start Updates</button>

					<div id="results">
						<div id="results-icecream" class="result">
							<h2>Ice Cream</h2>
							<span class="number">50%</span>
						</div>
						<div id="results-gelato" class="result">
							<h2>Gelato</h2>
							<span class="number">50%</span>
						</div>
					</div>

					<ul id="request-log">
						<li>Below is our request log! Requests fire every <strong><?php echo intval( LIVE_UPDATES_REQUEST_INTERVAL / 1000 ); ?></strong> seconds! Watch for cache misses!</small></li>
					</ul>

					<img src="<?php echo esc_url( get_stylesheet_directory_uri() . '/images/icecream-party.gif' ); ?>" alt="Ice cream party!" />

				</div><!-- .entry-content -->
			</article><!-- #post-## -->
		</main><!-- .site-main -->
	</div><!-- .content-area -->

	<script>
	jQuery( function( $ ) {
		function pbe_get_slow( request_number ) {
			var start_time = new Date();
			$.ajax( {
				url: '<?php echo esc_js( home_url( '/fetch.json?i=' ) ); ?>' + request_number,
				type: 'GET',
				dataType: 'json',
				success: function( data ) {
					pbe_update_results( data.data );

					var meta = data.meta;
					var elapsed_time = pbe_calculate_elapsed_time( start_time );
					var log = '#' + request_number + ': ' + ( meta.cache_miss ? 'cache miss' : 'cache hit' ) + ' (' + elapsed_time + 's)';
					pbe_update_log( log, meta.cache_miss );
				},
				error: function( data ) {
					var elapsed_time = pbe_calculate_elapsed_time( start_time );
					var message = 'AJAX request failed :( (' + elapsed_time + 's)';
					pbe_update_log( message );
				}
			} );
		}

		function pbe_update_results( results ) {
			$( '#results-icecream .number' ).text( results.icecream + '%' );
			$( '#results-gelato .number' ).text( results.gelato + '%' );
		}

		function pbe_update_log( message, cache_miss ) {
			$('<li/>')
				.addClass( cache_miss ? 'miss' : 'hit' )
				.html( message )
				.appendTo( $( '#request-log' ) );

			// Bump to bottom if at the top
			var log = document.getElementById( 'request-log' );
			log.scrollTop = log.scrollHeight;
		}

		function pbe_calculate_elapsed_time( start ) {
			var end = new Date(),
				diff = ( end - start ) / 1000,
				seconds = Math.round( diff % 60 );

			return seconds;
		}

		var request_number = 0,
			is_stampeding = false;
			stampede_interval = false;

		jQuery( '#start-fetching' ).on( 'click', function() {
			if ( ! is_stampeding ) {
				is_stampeding = true;
				$( this ).html( 'Stop Updates' );
				stampede_interval = setInterval( function() {
					request_number++;
					console.log( 'stampede request #' + request_number );
					pbe_get_slow( request_number );
				}, <?php echo intval( LIVE_UPDATES_REQUEST_INTERVAL ); ?> );
			} else {
				clearInterval( stampede_interval );
				is_stampeding = false;
				$( this ).html( 'Start Updates' );
				request_number = 0;
			}
		} );
	} );
	</script>

<?php get_footer(); ?>
