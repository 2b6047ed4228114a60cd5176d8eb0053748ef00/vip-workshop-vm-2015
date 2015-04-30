<?php

function vip_highlight_js_fix_text( $text ) {
	return preg_replace_callback( '#(<pre[^>]*?><code[^>]*?>)(.*?)(</code></pre>)#s', 'vip_highlight_js_fix_text_callback', $text );
}

function vip_highlight_js_fix_text_callback( $matches ) {
	$content = trim( htmlspecialchars( $matches[2], ENT_QUOTES ) );
	if ( preg_match( '/mark-(\d+)/', $matches[1], $mark ) ) {
		$lines = preg_split( '/(\r?\n)/', $content, -1, PREG_SPLIT_DELIM_CAPTURE );
		$line = 2 * ( intval( $mark[1] ) - 1 );
		if ( isset( $lines[$line] ) ) {
			$lines[$line] = '<mark class="highlight-line">' . $lines[$line] . '</mark>';
			$content = join( '', $lines );
		}
	}

	return $matches[1] . $content . $matches[3];
}

function vip_highlight_js() {
	wp_enqueue_script( 'highlight-js', plugins_url( '/highlight.js/highlight.pack.js', __FILE__ ), array(), '8.0', true );
	wp_enqueue_style( 'highlight-js', plugins_url( '/highlight.js/styles/github.css', __FILE__ ), array(), '8.0' );
	add_action( 'wp_print_footer_scripts', 'vip_highlight_js_start' );
}

function vip_highlight_js_start() {
?>
<script>hljs.initHighlightingOnLoad();</script>
<?php
}

add_action( 'wp_enqueue_scripts', 'vip_highlight_js' );

add_filter( 'the_content', 'vip_highlight_js_fix_text', 9 );
