<?php

return array(
    /**
     * Hostname to use for connecting to the redis server. Defaults to 'localhost'.
     */
    'hostname' => getenv('REDIS_HOST'),

    /**
     * The port to use for connecting to the redis server. Default port is 6379.
     */
    'port' => 6379,

    /**
     * The password to use to authenticate with the redis server. If not set, no AUTH command will be sent.
     */
    'password' => '',

    /**
     * The redis database to use. This is an integer value starting from 0. Defaults to 0.
     */
    'database' => 0,

    /**
     * Timeout to use for connection to redis. If not set the timeout set in php.ini will be used:
     * ini_get("default_socket_timeout")
     */
    'timeout' => null,
);
