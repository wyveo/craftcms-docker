<?php

/**
 *
 * Custom Redis configuration
 *
 */

return [
    'components' => [
        'cache' => [
            'class' => yii\redis\Cache::class,
            'defaultDuration' => 86400,
            'redis' => [
                'hostname' => getenv('REDIS_HOST'),
                'port' => 6379,
                'database' => 1,
            ],
        ],
    ],
];
