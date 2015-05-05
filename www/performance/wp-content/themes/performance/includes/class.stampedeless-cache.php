<?php

/*
 * The Stampedeless cache prevents runs on the data store whenever a cache value
 * expires by storing the value along with a separate lock.
 * When a value is soon going to expire the lock will be grabbed so that only
 * one process will actually regenerate the data rather than a stampede.
 *
 * Usage to prevent stampedes on cache expiration:
 *
 *   $slcache = new Stampedeless_Cache( 'key', 'group' );
 *   $val = $slcache->get();
 *   if ( false === $val ) {
 *     $val = $wpdb->get_results( ... );
 *     $slcache->set( $val, 5 * MINUTE_IN_SECONDS );
 *   }
 *
 * Usage to prevent stampedes on cache expiration and empty cache.
 *   This assumes you have default data to display initially.
 *   Use only if your application can live without real results.
 *
 *   $slcache = new Stampedeless_Cache( 'key', 'group' );
 *   $slcache->prevent_initial_stampede( 'default data' );
 *   $val = $slcache->get();
 *   if ( false === $val ) {
 *     $val = $wpdb->get_results( ... );
 *     $slcache->set( $val, 5 * MINUTE_IN_SECONDS );
 *   }
 */

class Stampedeless_Cache {

	var $cache_key;
	var $cache_group;
	var $query_runtime = 30;
	var $no_initial_stampede = false;
	var $default_data;

	function __construct( $key, $group ) {
		$this->cache_key = $key;
		$this->cache_group = $group;
	}

	function prevent_initial_stampede( $default_data = null ) {
		$this->no_initial_stampede = true;
		$this->default_data = $default_data;
	}

	function set( $val, $timeout ) {
		//reduce likelihood many keys will start expiring at the same time
		$rand_timeout = mt_rand( 0, 30 );
		$status = wp_cache_set( $this->cache_key, $val, $this->cache_group, $timeout + $this->query_runtime + $rand_timeout );
		wp_cache_set( $this->cache_key . '_lock', 1, $this->cache_group, $timeout + $rand_timeout );
	}

	function get() {
		$result = wp_cache_get( $this->cache_key, $this->cache_group );
		if ( false === $result ) {
			if ( $this->no_initial_stampede ) {
				$locked = wp_cache_add( $this->cache_key . '_lock', 1, $this->cache_group, $this->query_runtime );
				if ( $locked )
					return false;
				return $this->default_data;
			}
			return false;
		}

		$locked = wp_cache_add( $this->cache_key . '_lock', 1, $this->cache_group, $this->query_runtime );
		if ( $locked )
			return false;

		return $result;
	}

	function hard_expire_get() {
		$result = wp_cache_get( $this->cache_key . '_lock', $this->cache_group );
		if ( false === $result ) {
			return false;
		}
		return wp_cache_get( $this->cache_key, $this->cache_group );
	}
}
