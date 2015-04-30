<?php

// This file is super secret! Don't let anyone read it!

define('DB_NAME', 'performance');
define('DB_USER', 'username');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix  = 'performance_';

define('AUTH_KEY',         'kBlO-l8f ~e+8B:i!S/CbK<GPq:UvE/gxttOiJbLGva&m.r.-%3E&Vq4uGB.su5B');
define('SECURE_AUTH_KEY',  '4!uDZb?km7;|}>8Y9NEi]J(ROE[1K|/se+,k]U &-TSM*0.[RI=]}GLuQ`b-hK<l');
define('LOGGED_IN_KEY',    '=0-&7l/t,m&{u$d3C9^|}>u;BSU&TULk#/+ULBeI:UFCXl*^Z~xsllkhVqp9(..i');
define('NONCE_KEY',        'G[3~HXmYu6P:F+^Dj7!&@W1ofOmlPo?_@>+o(L$emBP-yrBkAD5IEHu}S]{(?&|q');
define('AUTH_SALT',        'hMF%opwGxu:S5s[VpbK*YR*~z.~tQ#W_wgHOx{5*Q@M^(Y849`9_SD+fVdAUUi^z');
define('SECURE_AUTH_SALT', 'RWjonM4j&io5p[;Fe4~ Go,&3NJ}w+(yR8&E(~>~ |-%]}8_K~3Q,<$)i|#krtkd');
define('LOGGED_IN_SALT',   'ByS++DS3t&N0z!cE3Rn&!+RWI 6r+x7ZT0.q^4r/jp:uy%@Pze/hW(OX#<3N|R%Q');
define('NONCE_SALT',       '7+2ou3-D5Z =|qT*rrQT{~F,SqJE*tICKqa1P^ic4v8{z.RoP ],zM^=UU=JaaKV');

define('WPLANG', '');

define('WP_DEBUG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_DEBUG_LOG', true);
define( 'SAVEQUERIES', true );

define('WP_HOME', 'http://vip-workshop.dev/performance');
define('WP_SITEURL', WP_HOME . '/wordpress' );

define('WP_CONTENT_DIR', __DIR__ . '/wp-content');
define('WP_CONTENT_URL', WP_HOME . '/wp-content');


if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');

error_reporting( E_ALL & ~E_DEPRECATED );
